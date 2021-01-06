/// @description Update position and hoverNode
x = mouse_x;
y = mouse_y;

gridX = floor(x/GRID_SIZE);
gridY = floor(y/GRID_SIZE);

if(gridX < 0 || gridY < 0 || gridX >= room_width/GRID_SIZE || gridY >= room_height/GRID_SIZE){
	hoverNode = noone;
}else{
	hoverNode = map[gridX, gridY];
}
// noteObjCursorStep: 30, 41
// --code start
// --code end
if(mouse_check_button_pressed(mb_left)){
	if(selected.actor != noone && hoverNode.moveNode){
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
		wipe_nodes();
		
		// --code end
	}
	
	if(selected.actor != noone && hoverNode.attackNode){
		selected.actor.canAct = false;
		selected.actor.atkTarget = hoverNode.occupant;
		
		
		switch(selected.actor.atkType){
			case ATTACK_TYPE_RANGED:
				selected.actor.atkTimer = TIME_ATTACK;
				selected.actor.state = ACTOR_ATTACK_BEGIN;
				selected.actor.actions -= 1;
				break;
			case ATTACK_TYPE_MELEE:
				var tempX = abs(hoverNode.gridX - selected.actor.gridX);
				var tempY = abs(hoverNode.gridY - selected.actor.gridY);
				if(tempX <= 1 && tempY <= 1){
					selected.actor.atkTimer = TIME_ATTACK;
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
		wipe_nodes();
	}
}