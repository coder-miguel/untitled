/// @description Update position and hoverNode
x = mouse_x;
y = mouse_y;

gridX = floor(x/GRID_SIZE);
gridY = floor(y/GRID_SIZE);

with(objButtonConfirm){
	if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord(hotKey))){
		other.selected.actor.state = ACTOR_ACTION_ACT;
		instance_destroy();
	}
}

hoverButton = instance_place(x, y, objButton);
if(hoverButton){
	hoverNode = noone;
	if(instance_place(x, y, objButton) == hoverButton){
		buttonTimer += 1;
	}else{
		buttonTimer = 0;
	}
}else{
	buttonTimer = 0;
	if(gridX < 0 || gridY < 0 || gridX >= room_width/GRID_SIZE || gridY >= room_height/GRID_SIZE){
		hoverNode = noone;
	}else{
		hoverNode = map[gridX, gridY];
	}
}

with(objButton){
	if(keyboard_check_pressed(ord(hotKey))){
		button_pressed(id);
	}
}
if(keyboard_check_pressed(vk_escape)){
	if(selected.actor.state == ACTOR_ACTION_BEGIN){
		selected.actor.state = ACTOR_IDLE;
		with(objButtonConfirm){
			instance_destroy();
		}
	}
	wipe_nodes();
	movement_range(map[selected.actor.gridX, selected.actor.gridY], selected.actor.move, selected.actor.actions);
	
	if(selected.actor.canAct){
		switch(selected.actor.atkType){
			case ATTACK_TYPE_RANGED:
				attack_range_ranged(selected.actor);
				break;
			case ATTACK_TYPE_MELEE:
				attack_range_melee(selected.actor);
				break;
		}
	}
}
// noteObjCursorStep: 30, 41
// --code start
// --code end
if(mouse_check_button_pressed(mb_left)){
	if(selected.actor && hoverButton){
		button_pressed(hoverButton);
	}
	if(instance_place(x, y, objButtonConfirm)){
		selected.actor.state = ACTOR_ACTION_ACT;
		with(objButtonConfirm){
			instance_destroy();
		}
	}
	if(selected.actor && hoverNode && hoverNode.moveNode){
		// noteObjCursorStep: 1, 29
		// --code start
		actor_path_create(selected.actor, hoverNode);
		actor_path_init(selected.actor, ACTOR_IDLE);
		
		// TODO:
		// --Replace the 2-action system
		// reduce selected actor's actions and wipe nodes
		if(hoverNode.g > selected.actor.move){
			selected.actor.actions -= 2;
		}else{
			selected.actor.actions -= 1;
		}
		selected.actor = noone;
		wipe_buttons();
		wipe_nodes();
		
		// --code end
	}
	
	if(selected.actor && hoverNode && hoverNode.attackNode){
		selected.actor.canAct = false;
		selected.actor.atkTarget = hoverNode.occupant;
		
		
		switch(selected.actor.atkType){
			case ATTACK_TYPE_RANGED:
				selected.actor.actTimer = TIME_ATTACK;
				selected.actor.state = ACTOR_ATTACK_BEGIN;
				selected.actor.actions -= 1;
				break;
			case ATTACK_TYPE_MELEE:
				var tempX = abs(hoverNode.gridX - selected.actor.gridX);
				var tempY = abs(hoverNode.gridY - selected.actor.gridY);
				if(tempX <= 1 && tempY <= 1){
					selected.actor.actTimer = TIME_ATTACK;
					selected.actor.state = ACTOR_ATTACK_BEGIN;
					selected.actor.actions -= 1;
				}else{
					var tempG = 127;
					var targetNode = noone;
					var currentNode;
					for(var ii = 0; ii < ds_list_size(hoverNode.neighbors); ii++){
						currentNode = ds_list_find_value(hoverNode.neighbors, ii);
						if(currentNode.occupant == noone && currentNode.g > 0 && currentNode.g < tempG){
							tempG = currentNode.g;
							targetNode = currentNode;
						}
					}
					actor_path_create(selected.actor, targetNode);
					actor_path_init(selected.actor, ACTOR_ATTACK_BEGIN);
					selected.actor.actions -= 2;
				}
				break;
		}
		selected.actor = noone;
		wipe_buttons();
		wipe_nodes();
	}
}