from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.db import models
from models import *
from django import forms

class GameCreationForm(forms.ModelForm):
    
    class Meta:
        model = Game
        exclude = ['participants']
        
class MessageForm(forms.ModelForm):
    
    class Meta:
        model = Message
        
class SettingsForm(forms.ModelForm):
    
    class Meta:
        model = Settings