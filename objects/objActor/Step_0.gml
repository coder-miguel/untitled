/// @description Process State of Actor
shake -= 1;
switch(state){
	case ACTOR_PATH_BEGIN:
		//begin moving along path
		path_start(path, pathSpeed, 0, false); // set to true if errors
		state = ACTOR_MOVING;
		break;
	case ACTOR_ATTACK_BEGIN:
		atkTimer -= 1;
		if(atkTimer <= 0){
			state = ACTOR_ATTACKING;
		}
		break;
	case ACTOR_ATTACKING:
	
		// make an attack roll
		var atkRoll = irandom_range(1, 20);
		var atkStatus = ATTACK_MISS;
		var sneakDmg = 0;
		if(ds_map_exists(skills, "sneak attack")){
			var tempNode = map[atkTarget.gridX, atkTarget.gridY];
			for(var ii = 0; ii < ds_list_size(tempNode.neighbors); ii++){
				var current = ds_list_find_value(tempNode.neighbors, ii);
				if(current.occupant != noone && current.occupant.army != atkTarget.army){
					sneakDmg = ds_map_find_value(skills, "sneak attack");
				}
			}
		}
				
		if(atkRoll == 20){
			atkStatus = ATTACK_CRIT;
		}else{
			if(atkRoll + hitBonus >= atkTarget.AC){
				atkStatus = ATTACK_HIT;
			}else{
				atkStatus = ATTACK_MISS;
			}
		}
		// center of all damage rolls
		var tempDamage = 0;
		if(atkStatus != ATTACK_MISS){
			tempDamage = irandom_range(1, dmgDie) + dmgBonus + ceil(sneakDmg * (irandom_range(1, 100) / 100));
			if(atkStatus == ATTACK_CRIT){
				tempDamage += irandom_range(1, dmgDie) + dmgBonus;
			}
		}
		var halfGrid = floor(GRID_SIZE / 2);
		switch(atkType){
			case ATTACK_TYPE_RANGED:
				
				var atkDir = point_direction(x + halfGrid, y + halfGrid, atkTarget.x + halfGrid, atkTarget.y + halfGrid);
				var beginX = x + halfGrid + lengthdir_x(GRID_SIZE, atkDir);
				var beginY = y + halfGrid + lengthdir_y(GRID_SIZE, atkDir);
				
				with(instance_create_depth(beginX, beginY, DEPTH_PROJECTILE, objArrow)){
					target = other.atkTarget;
					dmgType = other.dmgType;
					damage = tempDamage;
					status = atkStatus;
					
					path_add_point(path, beginX, beginY, 100);
					if(status != ATTACK_MISS){
						path_add_point(path, target.x + halfGrid, target.y + halfGrid, 100);
					}else{
						path_add_point(path,
						target.x + irandom_range(halfGrid, GRID_SIZE) * choose(-1, 1),
						target.y + irandom_range(halfGrid, GRID_SIZE) * choose(-1, 1), 100);
					}
					path_start(path, speed, true, true);
				}
				state = ACTOR_ATTACK_END;
				break;
			case ATTACK_TYPE_MELEE:
			
				if(atkStatus != ATTACK_MISS){
					for(var ii = 0; ii < 6; ii++){
						with(instance_create_depth(atkTarget.x + halfGrid, atkTarget.y + halfGrid, DEPTH_PARTICAL, objBiff)){
							direction = irandom(360);
							speed = choose(2, 4);
							scale = choose(2, 3);
							image_speed = 0.5;
							
							if(atkStatus == ATTACK_CRIT){
								color = c_yellow;
							}
						}
					}
					
					if(atkStatus == ATTACK_CRIT){
						atkTarget.shake = 8;
						atkTarget.shakeMag = 8;
					}else{
						atkTarget.shake = 4;
						atkTarget.shakeMag = 4;
					}
					
					atkTarget.HP -= tempDamage;
					
					with(instance_create_depth(atkTarget.x + 28, atkTarget.y + 2, DEPTH_FONT, objDmgText)){
						text = "-" + string(tempDamage);
						ground = y;
						if(atkStatus == ATTACK_CRIT){
							font = fntCrit;
						}
					}
				}else{
					with(instance_create_depth(atkTarget.x + 28, atkTarget.y + 2, DEPTH_FONT, objDmgText)){
						text = "MISS";
						ground = y;
					}
				}
				break;
		}
		atkTimer = 10;
		state = ACTOR_ATTACK_END;
		break;
	case ACTOR_ATTACK_END:
		atkTimer -= 1;
		if(atkTimer <= 0){
			if(actions > 0){
				game_cursor.selected.actor = id;
				movement_range(map[gridX, gridY], move, actions);
			}else{
				game.turnActor = noone;
			}
			state = ACTOR_IDLE;
		}
		break;
}
