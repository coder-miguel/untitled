/// @description End of Path

// clear path
path_clear_points(path);
state = ACTOR_IDLE;

if(actions > 0){
	game_cursor.selected.actor = id;
	movement_range(map[gridX, gridY], move, actions);
	
	if(canAct){
		switch(atkType){
			case ATTACK_TYPE_RANGED:
				attack_range_ranged(id);
				break;
			case ATTACK_TYPE_MELEE:
				attack_range_melee(id);
				break;
		}
	}
}else{
	game.turnActor = noone;
}