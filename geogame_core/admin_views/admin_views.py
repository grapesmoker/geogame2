'''
Created on Sep 10, 2012

@author: jerry
'''
import random

import datetime as dt

from geogame.geogame_core.models import *
from geogame.geogame_core.forms import *
from geogame.geogame_core.utils import *

from django.template import Context, RequestContext
from django.shortcuts import render_to_response
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponse, HttpResponseRedirect
from django.core.serializers import serialize
from django.views.decorators.csrf import csrf_exempt
from django.utils import simplejson

from geogame.geogame_core.views import active_players, active_players_lock, messages_queue, player_network, command_queue

@csrf_exempt
def get_active_player_info(request):
    if request.is_ajax():
        player = request.user.get_profile()
        if request.method == 'POST':
            if player.admin:
                # active_players_lock.acquire()
                players = active_players.items()
                player_data = []
                for username, player in players:
                    assigned_item = player.assigned_item
                    assigned_name = ''
                    if assigned_item is not None:
                        assigned_name = assigned_item.name
                        
                    player_data.append([username,
                                        player.location.name,
                                        len(player.item_set.all()),
                                        len(player.neighbors.all()),
                                        player.moving_flag,
                                        player.score,
                                        assigned_name])
                      
                return HttpResponse(simplejson.dumps({'aaData': player_data}), 'application/json')
                # active_players_lock.release()
            else:
                # TODO: not authorized
                print "NO PASARAN"
                pass
        else:
            # TODO: nope
            print "not a POST"
            pass
    else:
        print "NOT AJAX"
        # TODO: nuh-uh
        pass
    
@csrf_exempt
def change_game_settings(request):
    
    result = {}
    if request.user.is_authenticated():
        player = request.user.get_profile()
        if request.is_ajax():
            if request.method == 'POST':
                if player.admin:
                    form = SettingsForm(request.POST)
                    if form.is_valid():
                        form.save()
                        result = {'result': 'success',
                                  'message': 'Settings have been successfully saved!'}
                    else:
                        result = {'result': 'error',
                                  'message': 'There has been an error and your settings have not been saved!'}
                else:
                    result = {'result': 'error',
                              'message': 'Only admins can change game settings!'}
            else:
                result = {'result': 'error',
                          'message': 'No GETs allowed!'}
            
        else:
            return render_to_response('failure.html',
                                      {'message': 'Must make AJAX request!',
                                       'message-type': 'error'},
                                      context_instance=RequestContext(request))
    else:
        return render_to_response('failure.html',
                                  {'message': 'You are not authorized to access the admin interface!',
                                   'message-type': 'error'},
                                   context_instance=RequestContext(request))
            
    return HttpResponse(simplejson.dumps(result), 'application/json')


@csrf_exempt
def get_all_settings(request):
    
    result = {}
    if request.user.is_authenticated():
        player = request.user.get_profile()
        if request.is_ajax():
            if request.method == 'POST':
                if player.admin:
                    settings = Settings.objects.all()
                    data = []
                    for setting in settings:
                        data.append({'value': setting.id, 'name': setting.name})
                    result = {'result': 'success', 'data': data}
                    
                else:
                    result = {'result': 'failure', 'data': [], 'message': 'Only admins allowed!'}
            else:
                result = {'result': 'failure', 'data': [], 'message': 'Only POST allowed!'}
        else:
            result = {'result': 'failure', 'data': [], 'message': 'Only AJAX allowed!'}
    else:
        result = {'result': 'failure', 'data': [], 'message': 'Unauthorized!'}
        
    return HttpResponse(simplejson.dumps(result), 'application/json')

@csrf_exempt
def start_game(request):
    result = {}
    if request.user.is_authenticated():
        player = request.user.get_profile()
        if request.is_ajax():
            if request.method == 'POST':
                if player.admin:
                    for participant in active_players.values():
                        print 'new game'
                        new_game = Game.objects.latest('start_time')
                        print new_game
                        duration = new_game.settings.game_duration
                        command_queue.enqueue_message(participant.user.username, 
                                                      {'command': 'start_game',
                                                       'duration': duration})
                    result = {'result': 'success', 'message': 'Game has started!'}
                else:
                    result = {'result': 'failure', 'message': 'Only admins allowed!'}
            else:
                result = {'result': 'failure', 'message': 'Only POST allowed!'}
        else:
            result = {'result': 'failure', 'message': 'Only AJAX allowed!'}
    else:
        result = {'result': 'failure', 'message': 'Unauthorized!'}
        
    return HttpResponse(simplejson.dumps(result), 'application/json')

@csrf_exempt
def reset_game(request):
    result = {}
    if request.is_ajax():
        if request.method == 'POST':
            form = GameCreationForm(request.POST)
            if form.is_valid():
                print 'Creating new game...'
                active_players_lock.acquire()
                try:
                    player = request.user.get_profile()
                    new_game = form.save(commit=False)
                    game_settings = new_game.settings 
                    new_game.start_time = dt.datetime.now()
                    new_game.end_time = new_game.start_time + dt.timedelta(minutes=game_settings.game_duration)
                    new_game.save()
                    # get rid of all the actions, messages
                    print 'Clearing old actions and messages...'
                    Action.objects.all().delete()
                    Message.objects.all().delete()
                    
                    # clear out all items
                    print 'Clearing out all the items...'
                    for location in Location.objects.all():
                        location.item_set = []
                        location.save()
                        
                    # clear out player inventories
                    print 'Clearing out player inventories...'
                    for username, player in active_players.items():
                        player.item_set = []
                        player.save()
                        new_game.participants.add(player)
                        # init message queues
                        messages_queue[username] = []
                    
                    
                    # TODO: calculate locations map
                    print 'Calculating item placement...'
                    
                    
                    # create the user network
                    print 'Creating user network...'
                    if game_settings.rebuild_user_network:
                        create_user_network(game_settings.network_type, game_settings.graph_density)
                    
                    # distribute the items
                    print 'Distributing items...'
                    distribute_items(24)
                    
                    print 'Rebuilding road network...'
                    if game_settings.rebuild_road_network:
                        rebuild_road_network()
                    
                    # assign synonyms
                    print 'Assigning synonyms...'
                    assign_synonyms()
                        
                    # log the db reset
                    print 'Logging reset...'
                    action = Action()
                    action.action_type = 'DB_RESET'
                    action.player = player
                    action.time = dt.datetime.now()
                    action.save()
                except Exception as ex:
                    print ex
                finally:
                    active_players_lock.release()
                
                new_game.start_time = dt.datetime.now()
                new_game.save()
                
    return HttpResponse(simplejson.dumps(result), 'application/json')
                
                
# TODO:
def create_user_network(network_type, graph_density):
    
    if network_type == 'SMALL_WORLD':
        players = active_players.values()

        if len(players) == 0:
            return
        
        for i, player in enumerate(players[:-1]):
            if i < len(players):
                player.neighbors.add(players[i + 1])
                players[i+1].neighbors.add(player)
                player_network.add_edges_from([(player, players[i+1])])

        if len(players) > 2:
            first_player = players[0]
            last_player = players[len(players) - 1]
            first_player.neighbors.add(last_player)
            last_player.neighbors.add(first_player)
            player_network.add_edges_from([(first_player, last_player)])

        max_connections = len(players) * (len(players) - 1) / 2
        
        while average_graph_degree(player_network) < graph_density and player_network.number_of_edges() < max_connections:
            player1 = random.choice(players)
            player2 = random.choice(players)
            player1.neighbors.add(player2)
            player2.neighbors.add(player1)
            player_network.add_edges_from([(player1, player2)])

        for player in players:
            player.save()

# TODO:         
def distribute_items(items_to_place):
    item_types = ItemType.objects.all()
    locations = Location.objects.all()
    players = active_players.values()
    
    items_placed = []
    print players
    print item_types
    
    for i in range(items_to_place):
        location = random.choice(locations)
        item_type = random.choice(item_types)
        new_item = Item()
        new_item.item_type = item_type
        new_item.location = location
        new_item.save()
        
        items_placed.append(new_item)
        print new_item, item_type
    
    for player in players:
        player.score = 0
        player.location = random.choice(locations)
        player.moving_flag = False
        player.assigned_item = random.choice(items_placed).item_type
        print player, player.assigned_item
     
def rebuild_road_network(settings):
    
    for road in Road.objects.all():
        road.travel_duration = int(random.uniform(settings.min_road_time, settings.max_road_time))
        road.save()
    
def average_graph_degree(graph):
    degree = 0
    for deg in graph.degree().values():
        degree += deg
        
    degree /= graph.number_of_nodes()
    
    return degree

def assign_synonyms():
    pass


def geogame_admin(request):
    if request.user.is_authenticated():
        player = request.user.get_profile()
        if player.admin:
            return render_to_response('geogame_admin.html', {}, context_instance=RequestContext(request))
        
        else:
            return render_to_response('failure.html',
                                      {'message': 'You are not authorized to access the admin interface!',
                                       'message-type': 'error'},
                                      context_instance=RequestContext(request))
    else:
        return HttpResponseRedirect('/accounts/login')