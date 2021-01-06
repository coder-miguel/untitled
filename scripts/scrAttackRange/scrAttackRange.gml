// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function attack_range_ranged(actor){
	var halfGrid = floor(GRID_SIZE / 2);
	with(objActor){
		if(army != actor.army){
			if(point_distance(x + halfGrid, y + halfGrid, actor.x + halfGrid, actor.y + halfGrid)
			<= actor.atkRange){
				if(!collision_line(x + halfGrid, y + halfGrid, actor.x + halfGrid, actor.y + halfGrid,
				objWall, false, false)){
					map[gridX, gridY].attackNode = true;
					map[gridX, gridY].color = c_red;
				}
			}
		}
	}
}

function attack_range_melee(actor){
	var halfGrid = floor(GRID_SIZE / 2);
	with(objActor){
		if(army != actor.army){
			var tempX = abs(gridX - actor.gridX);
			var tempY = abs(gridY - actor.gridY);
			
			if(tempX <= 1 && tempY <= 1){
				map[gridX, gridY].attackNode = true;
				map[gridX, gridY].color = c_red;
			}
		}
	}
}