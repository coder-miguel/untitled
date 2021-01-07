// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function button_create(actor){
	//var actor = game.turnActor;
	var buttons = ds_list_create();
	for(var ii = 0; ii < ds_list_size(actor.actList); ii++){
		ds_list_add(buttons, ds_list_find_value(actor.actList, ii));
	}
	
	var buttonY = room_height - (GRID_SIZE * 2);
	var buttonX = room_width/2 - ((ds_list_size(buttons) - 1 * 48));
	var button;
	for(var ii = 0; ii < ds_list_size(buttons); ii++){
		button = ds_list_find_value(buttons, ii);
		switch(button){
			case ACT_END_TURN:
				with(instance_create_depth(buttonX + (ii * 96), buttonY, DEPTH_BUTTON, objButton)){
					sprite_index = sprButtonEndTurn;
					title = ACT_END_TURN;
					text = "End your turn";
					hotKey = "X";
				}
			break;
		}
	}
	ds_list_destroy(buttons);
}

function button_pressed(button){
	var actor = game.turnActor;
	switch(button.title){
		case ACT_END_TURN:
			actor.state = ACTOR_ACTION_BEGIN;
			actor.actReadied = ACT_END_TURN;
			actor.targetingType = "none";
			
			
			with(instance_create_depth(room_width/2, room_height, DEPTH_BUTTON, objButtonConfirm)){
				title = button.title;
				text = button.text;
				hotKey = button.hotKey;
			}
			wipe_buttons();
			wipe_nodes();
			break;
	}
}
function actor_perform(actor, action){
	switch(action){
		case ACT_END_TURN:
			actor.state = ACTOR_TURN_END;
			actor.actTimer = 20;
			break;
	}
}

function wipe_buttons(){
	with(objButton){
		instance_destroy();
	}
	game_cursor.hoverButton = noone;
}