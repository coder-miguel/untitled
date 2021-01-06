/// @description Process State of Game


switch (state){
	case GAME_INITIALIZING:
		with(objNode) {
			if(instance_position(x + floor(GRID_SIZE / 2), y + floor(GRID_SIZE / 2), objTerrain)){
				tempTerrain = instance_position(x + floor(GRID_SIZE / 2), y + floor(GRID_SIZE / 2), objTerrain);
				switch(tempTerrain.type){
					case TER_WALL:
					instance_change(objWall, false);
					type = TER_WALL;
					passable = false;
					break;
					case TER_HOLE:
					instance_change(objHole, false);
					type = TER_HOLE;
					passable = false;
					break;
					case TER_RUBBLE:
					instance_change(objRubble, false);
					type = TER_RUBBLE;
					cost = 2;
					break;
				}
				with(tempTerrain){
					instance_destroy();
				}
			}
			if(instance_position(x + floor(GRID_SIZE / 2), y + floor(GRID_SIZE / 2), objActor)){
				occupant = instance_position(x + floor(GRID_SIZE / 2), y + floor(GRID_SIZE / 2), objActor);
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
			turnActor.canAct = true;
			
			// Pass off actions and cursor control ONLY if actor is BLUE_ARMY
			// Or else set lash variable to true and set alarm
			if(turnActor.army == BLUE_ARMY){
				game_cursor.selected.actor = turnActor;
				movement_range(map[turnActor.gridX, turnActor.gridY], turnActor.move, turnActor.actions);
				
				switch(turnActor.atkType){
					case ATTACK_TYPE_RANGED:
						attack_range_ranged(turnActor);
						break;
					case ATTACK_TYPE_MELEE:
						attack_range_melee(turnActor);
						break;
				}
			}else{
				turnActor.flash = true;
				turnActor.alarm[0] = 30;
			}
		}
			
		break;
}