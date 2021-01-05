/// @description End of Path

// clear path
path_clear_points(path);
state = ACTOR_IDLE;

if(actions > 0){
	game_cursor.selected.actor = id;
	movement_range(map[gridX, gridY], move, actions);
}else{
	game.turnActor = noone;
}