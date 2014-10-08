import datetime as dt

from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.utils import simplejson

# hash map/redis store for messages?

NETWORK_TYPES = [('SMALL_WORLD', 'Small world'),]

class AcceptedForm(models.Model):
    
    name = models.CharField(max_length=100)
    content = models.TextField()
    order = models.IntegerField()
    active = models.BooleanField()
    button1_text = models.CharField(max_length=100)
    button2_text = models.CharField(max_length=100)
    

class Item(models.Model):
    
    owner = models.ForeignKey('Player', null=True)
    item_type = models.ForeignKey('ItemType')
    location = models.ForeignKey('Location', null=True)
    
    def __str__(self):
        return '{0!s}'.format(self.item_type.name)
    

class Location(models.Model):

    name = models.CharField(max_length=100)
    icon = models.CharField(max_length=500)
    location_type = models.IntegerField()
    latitude = models.FloatField()
    longitude = models.FloatField()
    
    def __str__(self):
        return '{0!s}'.format(self.name)

class Road(models.Model):
    
    name = models.CharField(max_length=100)
    location1 = models.ForeignKey('Location', related_name='location1')
    location2 = models.ForeignKey('Location', related_name='location2')
    road_points = models.TextField()
    length = models.IntegerField()
    travel_duration = models.IntegerField()
    
    def __str__(self):
        return '{0!s}'.format(self.name)

class Action(models.Model):
    
    action_type = models.CharField(max_length=100)
    player = models.ForeignKey('Player')
    time = models.DateTimeField()
    dest_player = models.ForeignKey('Player', related_name='destination_player', null=True)
    source_location = models.ForeignKey('Location', related_name='source_location', null=True)
    dest_location = models.ForeignKey('Location', related_name='dest_location', null=True)
    item = models.ForeignKey('Item', null=True)
    score_increase = models.IntegerField(null=True)
    new_score = models.IntegerField(null=True)
    location_items = models.CharField(max_length=1000, null=True)
    
class Command(models.Model):
    pass

class Message(models.Model):
    
    time_sent = models.DateField(blank=True)
    sender = models.ForeignKey('Player', blank=True)
    recipient = models.ManyToManyField('Player', related_name='recipient', blank=True)
    content = models.CharField(max_length=1000)
    
    def __str__(self):
        return '{0!s}'.format(self.content)
    

class ItemType(models.Model):
    
    synonyms = models.ManyToManyField('Synonym')
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=100)
    replenishable = models.BooleanField()
    icon = models.URLField()
    
    def __str__(self):
        return '{0!s}'.format(self.name)
    

class Synonym(models.Model):
    pass

class Player(models.Model):
    
    user = models.OneToOneField(User)
    
    score = models.IntegerField()
    moving_flag = models.BooleanField()
    neighbors = models.ManyToManyField('self')
    accepted_forms = models.ForeignKey(AcceptedForm)
    
    location = models.ForeignKey(Location, null=True)
    # messages = models.ManyToManyField(Message, null=True)
    # location = None
    
    assigned_item = models.ForeignKey(ItemType, null=True)
    
    admin = models.BooleanField()
    
    status = ''
    last_req = None
    
    def __init__(self, *args, **kwargs):
        super(Player, self).__init__(*args, **kwargs)
        self.last_req = dt.datetime.now()
        self.status = 'active'
    
    def __str__(self):
        return '{0!s}'.format(self.user.username)
        
class Settings(models.Model):
    
    game_duration = models.IntegerField()
    network_type = models.CharField(max_length=100, choices=NETWORK_TYPES)
    graph_density = models.FloatField()
    average_degree = models.FloatField()
    
    rebuild_user_network = models.BooleanField()
    rebuild_road_network = models.BooleanField()
    new_item_assignment = models.BooleanField()
    communication_allowed = models.BooleanField()
    
    min_road_time = models.IntegerField()
    max_road_time = models.IntegerField()
    
    name = models.CharField(max_length=200, unique=True)
    

class Game(models.Model):
    
    start_time = models.DateTimeField(blank=True)
    end_time = models.DateTimeField(blank=True)
    settings = models.ForeignKey(Settings)
    
    participants = models.ManyToManyField(Player)
    

def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Player.objects.create(user=instance)

post_save.connect(create_user_profile, sender=User)