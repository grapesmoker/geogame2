from django.conf.urls.defaults import patterns, include, url
from django.views.generic import DetailView, ListView
from geogame_core.views import *
from geogame_core.admin_views.admin_views import *
from django.contrib.auth.views import login, logout

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'geogame.views.home', name='home'),
    # url(r'^geogame/', include('geogame.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    
    ('^hello/$', hello),
    ('^index/$', index),
    ('^$', geogame_main),
    (r'^accounts/login/$', login),
    (r'^accounts/logout/$', logout),
    (r'^accounts/profile/$', geogame_main),
    (r'^main/$', main),
    (r'^register/$', register),
    (r'^geogame_main/$', geogame_main),
    (r'^rpc/json_test/$', json_test),
    
    # admin stuff
    
    (r'^rpc/get_game_info/$', get_game_info),
    (r'^rpc/get_active_player_info/$', get_active_player_info),
    (r'^rpc/reset_game/$', reset_game),
    (r'^rpc/change_game_settings/$', change_game_settings),
    (r'^rpc/get_all_settings/$', get_all_settings),
    (r'^rpc/start_game/$', start_game),
    
    # player stuff 
    
    (r'^rpc/get_locations/$', get_locations),
    (r'^rpc/send_message/$', send_message),
    (r'^rpc/take_item/$', take_item),
    (r'^rpc/maintain_activity/$', maintain_activity),
    (r'^rpc/update_client/$', update_client),
    (r'^geogame_admin/$', geogame_admin),
    url(r'^admin/', include(admin.site.urls)),
)

urlpatterns += patterns('', (
        r'^static/(?P<path>.*)$',
        'django.views.static.serve',
        {'document_root': 'static'}))