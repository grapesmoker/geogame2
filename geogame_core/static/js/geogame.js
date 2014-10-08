var GeoGame = {
	
	gameInfo: new Object,
	
	getGameInfo: function() {
		$.post("/rpc/get_game_info/", 
		{ }, function(game_info) {
			GeoGame.gameInfo = game_info;
		})
	}
}

/* let's have a separate class keeping track of the player state*/

function Player() {
	this.score = 0;
	this.id = 0;
	this.location = -1;
	this.item = '';
}

function DisplayedLocation() {
	this.location_id = -1;
}

var currentPlayer = new Player();
var currentDisplayedLocation = new DisplayedLocation();

function send_message() {
	var message = $("#chatTextArea").val()
	$.post('/rpc/send_message/', 
		{ content: message },
		function() {
			$('#chatTextArea').val('')
		}
	)
};

$(function() {
	
	
	
	$('#chatTextArea').attr('rows', 3).attr('cols', 22).val('');
	$('#messageDisplay').height(517);
	$('#locationBar').height(600);
	
	$('#chatTextArea').keydown(function(key_event) {
		if (key_event.which == 13) {
			send_message();
		}
	});
	
	window.setInterval(function() {
		$.post('/rpc/update_client/', { player_state: currentPlayer }, function(data) {
			
			/* update any messages that need to be printed */
			
			var messages = data['messages']
			$.each(messages, function(index, message) {
				$('#messageDisplay').append('<p><b>' + message['sender'] + ': </b>' + message['content'] + '</p>')
			});
			var total_height = 0;
			$.each($('#messageDisplay>p'), function(index, par_obj) {
				total_height += $(par_obj).height();
			});
			if (total_height >= 250) {
				$('#messageDisplay>p:eq(0)').remove();
			}
			
			/* if the user's assigned item has changed, update that */
			
			var assigned_item = data['assigned_item'];
			if (assigned_item['item_type'] != currentPlayer.item) {
				$('#itemImage>img').remove();
				$('#itemImage').append('<img src="/static/img/items/' + assigned_item['icon'] + '">');
				$('#itemImage>img').height(96);
				
				currentPlayer.item = assigned_item['item_type'];
			}
			
			/* if the user's score has changed, update that */
			
			var scores = data['scores'];
			var total_score = currentPlayer.score;
			$.each(scores, function(i, score) {
				total_score += parseInt(scores);
			});
			
			if (total_score != currentPlayer.score) {
				$('#scoreBox').html('<h3>' + total_score + '</h3>')
				currentPlayer.score = total_score
			}
			
			/* if any commands have come in from the command queue, we must handle those */
			
			var commands = data['commands']
			// console.log(commands)
			
			$.each(commands, function(index, command) {
				if (command['command'] == 'update_location') {
					var id = command['id']
					var city_to_update = city_network.get_city_by_id(id)
					city_to_update['items'] = command['items']
					if (id == currentDisplayedLocation.location_id) {
						// force a redraw
						currentDisplayedLocation.location_id = -1
					}
				}
				if (command['command'] == 'start_game') {
					var duration = command['duration'] // assume minutes
					var start_time = new Date()
					var end_time = start_time.setMinutes(start_time.getMinutes() + duration)
					$('#timer').countdown({
						minsOnly: true,
						date: end_time,
					})
					game_running = true;
				}
			});
			/* if the user's location has changed, we have to redraw the location bar
			 * note that the actual modification of what's stored in the environment
			 * is handled via the command interface, so after the command queue is handled
			 * above the true state of the world should be reflected in the city_network
			 */
			
			if (currentDisplayedLocation.location_id != currentPlayer.location) {
				if (typeof city_network !== 'undefined') {
					var loc = currentPlayer.location;
					var current_city = city_network.get_city_by_id(loc)
					console.log(current_city)
					$('#locationLabel').html('<h3>Location: ' + current_city['name'] + '<br>Items (click to take): </h3>')
					$('#itemContainer').empty()
					
					$.each(current_city['items'], function(index, item) {
						
						$('#itemContainer').append('<p><img src="/static/img/items/' + item['icon'] + '"></p>')
						var img = $('#itemContainer>p>img:last')
						img.click(function() {
							$.post('/rpc/take_item/', {player_state: currentPlayer, item_id: item['id']}, function(data) {
								console.log(data);
							})
						});
						console.log(img.attr('src'))
						
						$('#itemContainer>p>img').height(64)
					});
				}
				currentDisplayedLocation.location_id = currentPlayer.location;
			}
			
		});
	}, 1000);
	
	
	$.post('/rpc/get_game_info/', {}, function(game_info) {
		currentPlayer.id = game_info['player_id'];
		currentPlayer.location = game_info['player_location'];
		currentPlayer.score = game_info['player_score'];
		$('#scoreBox').html('<h3>' + currentPlayer.score + '</h3>')
	})
	
	
	
	currentDisplayedLocation.location_id = currentPlayer.location;
})


