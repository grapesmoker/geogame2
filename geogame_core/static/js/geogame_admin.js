
function reset_game() {
	
}

$(function() {
	
	player_table = $('#player-table').dataTable( {
					'bProcessing': false,
					'bServerSide': true,
					'bJQueryUI': true,
					'sServerMethod': 'POST',
					'sAjaxSource': '/rpc/get_active_player_info/'
					});
					
	window.setInterval(function () {
		player_table.fnReloadAjax();
	}, 1000)
	
	
	$('#reset-dialog').dialog( {
		autoOpen: false,
		height: 250,
		width: 300,
		modal: true,
		buttons: {
			'Reset game': function() {
				$.post('/rpc/reset_game/', $('#reset-form').serialize(), function(result) {
					console.log(result)
				});
				$(this).dialog('close');
			},
			
			'Cancel': function() {
				$(this).dialog('close');
			}
		}
	});
	
	$('#message-dialog').dialog({
		autoOpen: false,
		height: 250,
		width: 300,
		modal: true,
		buttons: {
			'Ok': function() {
				$(this).dialog('close');
			}
		}
	});
	
	$('#settings-dialog').dialog( {
		autoOpen: false,
		height: 520,
		width: 400,
		modal: true,
		buttons: {
			'Save settings': function() {
				$.post('/rpc/change_game_settings/', $('#settings-form').serialize(), function (result) {
					console.log(result)
					if (result['result'] == 'success') {
						var result_dialog = $('<div class="ui-state-highlight"></div>').html(result['message']).dialog( {
							buttons: {
								'OK': function() {
									$(this).dialog('close');
								}
							}
						});
					}
				});
				$(this).dialog('close');
			},
			
			'Cancel': function() {
				$(this).dialog('close');
			}
		}
	});
	
	$('#reset-game').click(function() {
		console.log('Resetting game');
		console.log($('#reset-form').serialize());
		$.post('/rpc/get_all_settings/', {}, function(result) {
			console.log(result)
			if (result['result'] == 'success') {
				$('#id_settings').children().remove();
				$.each(result['data'], function(index, setting) {
					$('#id_settings').append('<option value="' + setting['value'] + '">' + setting['name'] + '</option>');
				});
			}
		})
		$('#reset-dialog').dialog('open');
	});
	
	$('#start-game').click(function() {
		console.log('Starting game');
		$.post('/rpc/start_game/', {}, function(result) {
			console.log(result)
			$('#message-dialog').html('<p class="error">' + result['message'] + '</p>')
			$('#message-dialog').dialog('open')
		})
	})
	
	$('#change-game-settings').click(function() {
		console.log('Settings');
		$('#settings-dialog').dialog('open')
	});
	
})
