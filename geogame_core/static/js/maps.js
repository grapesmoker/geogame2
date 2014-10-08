var geogame_map;
var player_marker;
var city_markers = new Object;
var roads = new Array;
var city_network;
var game_running = false;

function initialize() {
	
	var myOptions = {
		center : new google.maps.LatLng(73, 106),
		zoom : 8,
		mapTypeId : google.maps.MapTypeId.SATELLITE
	};
	
	geogame_map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
}

function place_city(id, name, lat, lng) {
	var loc = new google.maps.LatLng(lat, lng)
	var marker_options = {
		clickable: true,
		flat: true,
		position: loc,
		map: geogame_map,
		title: name,
		icon: '/static/img/palace-2.png',
		//labelContent: name,
		//labelClass: 'map_labels',
		//labelAnchor: new google.maps.Point(24, 48),
		zIndex: 10,
		//optimized: false
	};

	var city_marker = new google.maps.Marker(marker_options);
	// var city_marker = new MarkerWithLabel(marker_options);

	var city_label = new MapLabel({
          text: name,
          position: loc,
          map: geogame_map,
          fontSize: 14,
          align: 'center',
          zIndex: 1
	});
	city_label.set('zIndex', 1);
	city_marker.bindTo('geogame_map', city_label);
    city_marker.bindTo('position', city_label);
	city_marker.name = name
	google.maps.event.addListener(city_marker, 'click', function() {
		move_player(id)
	})
	city_markers[id] = city_marker;
	
}

function create_road(src_lat, src_lng, targ_lat, targ_lng) {
	var srcLatLng = new google.maps.LatLng(src_lat, src_lng);
	var targLatLng = new google.maps.LatLng(targ_lat, targ_lng);
	
	var road_line = new google.maps.Polyline({
		map: geogame_map,
		strokeOpacity: 0.5,
		strokeColor: "blue",
		strokeWeight: 5,
		path: [srcLatLng, targLatLng],
		zIndex: -1
	});
	
	var road = {
		src_loc: srcLatLng,
		targ_loc: targLatLng,
		line: road_line
	}
	roads.push(road);
}

function place_player_at_city(id) {
	var city_pos = city_markers[id].getPosition()
	
	place_player_at_loc(city_pos.lat(), city_pos.lng())
	player_marker.current_location = id
	currentPlayer.location = id
}

function place_player_at_loc(lat, lng) {
	var loc = new google.maps.LatLng(lat, lng)
	var marker_options = {
		clickable: false,
		flat: false,
		position: loc,
		map: geogame_map,
		icon: '/static/img/person.png',
		zIndex: 1000
	}
	
	player_marker = new google.maps.Marker(marker_options)
}


function move_player(trg_city_id) {

	if(is_movement_allowed(trg_city_id)) {
		var trg_city_pos = city_markers[trg_city_id].getPosition()
		var current_pos = player_marker.getPosition()

		var num_segments = 100
		var time_to_move = 15000
		var time_delta = time_to_move / num_segments

		var delta_lat = (trg_city_pos.lat() - current_pos.lat()) / num_segments
		var delta_lng = (trg_city_pos.lng() - current_pos.lng()) / num_segments

		for( i = 0; i < num_segments; i++) {
			window.setTimeout(function(lat, lng) {
				player_marker.setPosition(new google.maps.LatLng(lat, lng))
				player_marker.setZIndex(100)
			}, (i + 1) * time_delta, (i + 1) * delta_lat + player_marker.getPosition().lat(), (i + 1) * delta_lng + player_marker.getPosition().lng())
		}

		window.setTimeout(function(loc) {
			player_marker.current_location = loc;
			currentPlayer.location = loc;
		}, num_segments * time_delta, trg_city_id)
	}
	else {
		console.log('Movement not allowed!')
	}
}


function update_player_position(lat, lng) {
	player_marker.setPosition(new google.maps.LatLng(lat, lng))
}

function is_movement_allowed(trg_city_id) {
	
	if (!game_running) {
		var dialog = $('<div></div>').html('The game is not running!')
		.dialog({
			autoOpen: false,
			title: 'Movement prohibited!'
		});
		dialog.dialog('open');
		return false;
	}
	
	current_loc_id = player_marker.current_location

	for (link in city_network['links']) {
		
		if ((city_network['links'][link]['source'] == current_loc_id && city_network['links'][link]['target'] == trg_city_id) ||
			(city_network['links'][link]['target'] == current_loc_id && city_network['links'][link]['source'] == trg_city_id)) {
				return true;
			}
	}
	
	var dialog = $('<div></div>').html('Movement between those locations is not allowed!')
	.dialog({
		autoOpen: false,
		title: 'Movement prohibited!'
	});
	dialog.dialog('open');
	return false;
}

$(function() {
	initialize();
	
	$.post('/rpc/get_locations/', {}, function(cities) {
		jQuery.each(cities["nodes"], function(i, city) {
			place_city(city.id, city.name, city.lat, city.lng);
		})

		jQuery.each(cities["links"], function(i, link) {
			var road_points = Array();
			var src_lat, src_lng, targ_lat, targ_lng;

			jQuery.each(cities["nodes"], function(j, city) {
				if(city.id == link.source) {
					src_lat = city.lat;
					src_lng = city.lng;
				}

				if(city.id == link.target) {
					targ_lat = city.lat;
					targ_lng = city.lng;
				}
			})
			create_road(src_lat, src_lng, targ_lat, targ_lng);
		})
		
		city_network = cities
		
		city_network.get_city_by_id = function(id) {
			for (city_id in this['nodes']) {
				if (city_network['nodes'][city_id].id == id) {
					return city_network['nodes'][city_id];
				}
			}
		}

		
		$.post('/rpc/get_game_info/', {}, function(game_info) {
			console.log(game_info)
			console.log(game_info['player_id'])
			currentPlayer.id = game_info['player_id'];
			currentPlayer.location = game_info['player_location'];
			currentPlayer.score = game_info['player_score'];
			place_player_at_city(currentPlayer.location)
			player_marker.setZIndex(google.maps.Marker.MAX_ZINDEX + 1)
		});
	});
})

function test() {
	GeoGame.getGameInfo()
}
