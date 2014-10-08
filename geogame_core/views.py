# import redis
import time
import random
import networkx as nx

from collections import OrderedDict

from threading import Lock, Thread
from Queue import Queue

from django.template.loader import get_template
from django.template import Context, RequestContext
from django.shortcuts import render_to_response
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponse, HttpResponseRedirect
from django.core.serializers import serialize
from django.views.decorators.csrf import csrf_exempt
from django.utils import simplejson


from models import *
from forms import *
from utils import *

# r_server = redis.Redis('localhost')

active_players = {}
active_players_lock = Lock()

player_network = nx.Graph()
network_initialized = False

messages_queue = SynchronizedMessageQueue()
score_queue = SynchronizedMessageQueue()
command_queue = SynchronizedMessageQueue()

'''
    The command queue is used to propagate information about changes in the world.
    For example, changes in what items are stored in what locations, or perhaps
    changes in road travel times.
    
    ** Command syntax **
    
    A command is a dict that has the following strucutre:
    
    command = {'command': command_name,
                'args': {'arg1': arg1, 'arg2': arg2, ... }}
                
    Args themselves may be arrays or dicts as required
                
    ** Command types **
    
    *** Update location ***
        command_name: 'update_location'
        args: 'id' = location_id
        items: [{'item_type': item.item_type.name, 'id': item.id, 'icon': item.item_type.icon}]
        
    *** Start game (admin) ***
        command_name: 'start_game'
        args: 'duration' = duration
        
'''


def init_player_network():
    ''' A little hack to make it possible to load the player network right from the db
    instead of having to hit "reset" every time
    '''
    
    for name, player in active_players.items():
        for neighbor in player.neighbors.all():
            player_network.add_edges_from([(player, neighbor)])


def monitor_active_users():
    
    interval = dt.timedelta(seconds=5)
    while 1:
        active_players_lock.acquire()
        try:
            for username, player in active_players.items():
                now = dt.datetime.now()
                if player.last_req + interval < now:
                    del active_players[username]
        except Exception as ex:
            print ex
        finally:
            active_players_lock.release()
            
        time.sleep(1)
        
def add_active_user(player):
    active_players_lock.acquire()
    try:
        if player.user.username not in active_players:
            active_players[player.user.username] = player
    except Exception as ex:
        print ex
    finally:
        active_players_lock.release()

def update_active_user(username, score, location):
    
    active_players_lock.acquire()
    try:
        active_players[username].last_req = dt.datetime.now()
        active_players[username].location = location
        active_players[username].score = score
        print username, score, location
    except Exception as ex:
        pass
        # print ex
    finally:
        active_players_lock.release()
        
def get_active_user(player):
    active_players_lock.acquire()
    active_player = None
    try:
        active_player = active_players[player.user.username]
    except Exception as ex:
        # fail silently for now
        pass
        # print 'butts', ex
    finally:
        active_players_lock.release()
        return active_player

monitor_thread = Thread(target=monitor_active_users)
monitor_thread.setDaemon(True)
monitor_thread.start()

@csrf_exempt
def maintain_activity(request):
    if request.user.is_authenticated():
        if request.is_ajax():
            if request.method == 'POST':    
                update_thread = Thread(target=update_active_user, args=(request.user.get_profile(),))
                update_thread.setDaemon(True)
                update_thread.start()
                
                return HttpResponse(simplejson.dumps({'status': 'updated'}), 'application/json')

@csrf_exempt
def update_client(request):
    if request.user.is_authenticated():
        if request.is_ajax():
            if request.method == 'POST':
                data = {}
                player = request.user.get_profile()
                client_score = int(request.POST['player_state[score]']) 
                client_location = Location.objects.get(id=int(request.POST['player_state[location]']))
                print player.user.username, client_score, client_location
                
                cache_player = get_active_user(player)

                # distribute messages
                messages = messages_queue.dequeue_message(player.user.username)
                messages_to_distribute = []
                
                for message in messages:
                    messages_to_distribute.append({'sender': str(message.sender), 'content': str(message.content)})
                    
                data['messages'] = messages_to_distribute
                
                # distribute score
                data ['scores'] = []

                try:
                    scores = score_queue.dequeue_message(player.user.username)
                    scores_to_distribute = []
                    
                    for score in scores:
                        scores_to_distribute.append(score)

                    data['scores'] = scores_to_distribute
                except Exception as ex:
                    print 'sheeeeit', ex
                 
                # update item to find
                
                try:
                    assigned_item = cache_player.assigned_item
                    assigned_item_info = {'item_type': assigned_item.name, 'icon': assigned_item.icon}
                except:
                    assigned_item_info = []
                    
                data['assigned_item'] = assigned_item_info
                
                commands = command_queue.dequeue_message(player.user.username)
                data['commands'] = commands
                
                # update user activity
                update_thread = Thread(target=update_active_user, args=(player.user.username, client_score, client_location))
                update_thread.setDaemon(True)
                update_thread.start()
                
                return HttpResponse(simplejson.dumps(data), 'application/json')

def hello(request):
    return HttpResponse('Hello world! butts')

def index (request):
    t = get_template('index.html')
    html = t.render(Context())
    return render_to_response('index.html', {})

def register (request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            new_user = form.save()
            return HttpResponseRedirect("/main/")
    else:
        form = UserCreationForm()
    return render_to_response('registration/register.html',
                              {'form': form, 'next': '/main/'},
                              context_instance=RequestContext(request))

def main (request):
    if request.user.is_authenticated():
        return render_to_response('main.html', {}, context_instance=RequestContext(request))
    else:
        return HttpResponse('<font color="red">bad shit happened</font>')

def geogame_main(request):
    user = request.user
    if user is not None:
        if request.user.is_authenticated():
            add_active_user_thread = Thread(target=add_active_user, args=(request.user.get_profile(),))
            add_active_user_thread.setDaemon(True)
            add_active_user_thread.start()
            
            init_player_network();
            print 'network:', player_network.nodes()
            
            return render_to_response('geogame_main.html', {'player': user.get_profile() }, context_instance=RequestContext(request))
        else:
            return HttpResponse("You are not allowed to access this section!")
    else:
        return HttpResponse("User is null")
    
@csrf_exempt
def json_test(request):
    data = {}
    message = "blargh"
    if request.is_ajax():
        if request.method == "GET":
            message = "this is a get request"
        elif request.method == "POST":
            message = "this is a post request"
            # print request.POST
        data = {"look": "at this", "bull": "shit", "message": message}
    else:
        message = "buttts?"
      
    return HttpResponse(simplejson.dumps(data), "application/json")

@csrf_exempt
def get_game_info(request):
    data = {}
    if request.is_ajax():
        if request.method == "POST":
            player = request.user.get_profile();
            cache_player = get_active_user(player)
            data['player_id'] = cache_player.id
            data['player_location'] = cache_player.location.id
            data['player_score'] = cache_player.score
    
    return HttpResponse(simplejson.dumps(data), 'application/json')

@csrf_exempt
def get_locations(request):
    data = []
    if request.is_ajax():
        if request.method == 'POST':
            all_locations = Location.objects.all()
            node_data = [{'id': loc.id, 'name': loc.name, 'lat': loc.latitude, 'lng': loc.longitude,
                          'items': [{'item_type': item.item_type.name, 'id': item.id, 'icon': item.item_type.icon} for item in loc.item_set.all()]} for loc in all_locations]
            all_roads = Road.objects.all()
            link_data = [{'source': road.location1_id, 'target': road.location2_id, 'duration': road.travel_duration} for road in all_roads]
            data = {'nodes': node_data, 'links': link_data}
            #data = {'nodes': [{loc.name: {'lat': loc.latitude, 'lng': loc.longitude} for loc in all_locations}]}
    return HttpResponse(simplejson.dumps(data), 'application/json')

@csrf_exempt
def take_item(request):
    data = []
    if request.is_ajax():
        if request.method == 'POST':
            
            item_id = request.POST['item_id']
            player = request.user.get_profile()
            cache_player = get_active_user(player)
            item = Item.objects.get(id=item_id)
            item_location = item.location
            player_location = Location.objects.get(id=int(request.POST['player_state[location]']))
            
            print cache_player.assigned_item.id, item.item_type.id
            
            try:               
                if cache_player.assigned_item.id == item.item_type.id and player_location.id == item_location.id:
                    print 'Found item', item.id, item.item_type.name
                    item.owner = player
                    
                    '''
                    TODO:
                    1. handle score propagation to neighbors - Done
                    2. get rid of the item unless it's replenishable
                    3. if we got rid of the item generate a new one
                    4. assign a new item
                    5. if that item does not exist in the world, generate it
                    
                    '''
                    
                    
                    # propagate scores
                    # note that this automatically propagates the score to the player picking
                    # up the item, as their distance from themselves is 0
                    
                    print player_network.nodes()
                    
                    for other_player in player_network:
                        print other_player
                        distance = nx.shortest_path_length(player_network, player, other_player)
                        if distance <= 3:
                            score = 1000 / (2**distance)
                            print score
                            score_queue.enqueue_message(other_player.user.username, score)
                            
                    # what does "replenishable" mean? does that mean the item should remain at
                    # its current place or that it should be regenerated somewhere in the world?
                    # for now let's go with the latter interpretation
                    
                    all_item_types = ItemType.objects.all()
                    all_locations = Location.objects.all()

                    item.location = None
                    item.save()
                    
                    if item.item_type.replenishable:
                        
                        print item_location.item_set.all()
                        print 'commands'
                        
                        new_item = Item(item_type=item.item_type)
                        new_item.location = random.choice(all_locations)
                        new_item.save()
                        
                        # use the command queue to propagate changes in the world state to all users
                        for username in active_players:
                            command_queue.enqueue_message(username, 
                                                          {'command': 'update_location',
                                                           'id': item_location.id,
                                                           'items': [{'item_type': item.item_type.name, 'id': item.id, 'icon': item.item_type.icon} 
                                                                     for item in item_location.item_set.all()]})
                            command_queue.enqueue_message(username, 
                                                          {'command': 'update_location',
                                                           'id': new_item.location.id,
                                                           'items': [{'item_type': item.item_type.name, 'id': item.id, 'icon': item.item_type.icon} 
                                                                     for item in new_item.location.item_set.all()]})
                        
                    # assign the user a new item
                    
                    new_assigned_item = Item(item_type=random.choice(all_item_types))
                    new_assigned_item.location = random.choice(all_locations)
                    new_assigned_item.save()
                    cache_player.assigned_item = new_assigned_item
                    
                    
                    data = {'result': 'success'}
                else:
                    print 'this is not the item you are looking for'
                    data = {'result': 'failure', 'message': 'You do not need that item!'}
                    
                     
            except:
                data = []
            finally:
                return HttpResponse(simplejson.dumps(data), 'application/json')
                

@csrf_exempt
def send_message(request):
    data = []
    if request.is_ajax():
        if request.method =='POST':
            try:
                print 'Sending message'
                player = request.user.get_profile()
                message = Message()
                message.sender = player
                message.content = request.POST['content']
                message.time_sent = dt.datetime.now();
                message.save()
                for recipient in player.neighbors.all():
                    message.recipient.add(recipient)
                    messages_queue.enqueue_message(recipient.user.username, message)
                    
                    
                messages_queue.enqueue_message(player.user.username, message)
                score_queue.enqueue_message(player.user.username, 1000)
                
                message.recipient.add(player)
                message.save()
                
                data = {'status': 'success'}
            except Exception as ex:
                print ex
                
            return HttpResponse(simplejson.dumps(data), 'application/json')

# TODO:
def assign_synonyms():
    pass
