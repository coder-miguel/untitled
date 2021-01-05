/// @description Single Step objNode Initialize


switch (state){
	case GAME_INITIALIZING:
		with(objNode) {
			if(instance_position(x + 16, y + 16, objTerrain)){
				tempTerrain = instance_position(x + 16, y + 16, objTerrain);
				switch(tempTerrain.type){
					case TER_WALL:
					type = TER_WALL;
					sprite_index = sprWall;
					passable = false;
					break;
					case TER_HOLE:
					type = TER_HOLE;
					sprite_index = sprNode;
					passable = false;
					break;
					case TER_RUBBLE:
					type = TER_RUBBLE;
					sprite_index = sprRubble;
					cost = 2;
					break;
				}
				with(tempTerrain){
					instance_destroy();
				}
			}
			if(instance_position(x + 16, y + 16, objActor)){
				occupant = instance_position(x + 16, y + 16, objActor);
				occupant.gridX = gridX;
				occupant.gridY = gridY;
			}
		}
		state = GAME_ROLL_INIT;
		break;
	case GAME_ROLL_INIT:
		// TODO:
		// --Create a list of actors during initialization...
		// --Make tempInit a local variable...
		// --Iterate through actors instead of using with(objActor){}.
		tempInit = ds_priority_create();
		with(objActor){
			var initRoll = irandom_range(1, 20) + initiative;
			ds_priority_add(other.tempInit, id, initRoll);
		}
		while(ds_priority_size(tempInit) > 0){
			ds_list_add(turnOrder, ds_priority_delete_max(tempInit));
		}
		turnMax = ds_list_size(turnOrder);
		ds_priority_destroy(tempInit);
		state = GAME_READY;
		break;
	case GAME_READY:
		if(turnActor == noone){
			turnCounter++;
			if(turnCounter >= turnMax){
				turnCounter = 0;
				roundCounter++;
			}
			
			turnActor = ds_list_find_value(turnOrder, turnCounter);
			// TODO:
			// --Replace 2-action system
			turnActor.actions = 2;
			game_cursor.selected.actor = turnActor;
			movement_range(map[turnActor.gridX, turnActor.gridY], turnActor.move, turnActor.actions);
		}
			
		break;
}