// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// reset data of ALL nodes
function wipe_nodes(){
	with(objNode){
		moveNode = false;
		attackNode = false;
		g = 0;
		parent = noone;
		color = c_white;
	}
}
// TODO:
// --Replace the 2-action system
/// @description Color nodes based on remaining movement and action points
// @arg node Node to color
// @arg move Movement range
// @arg actions Remaining Actions
function color_move_node(node, move, actions){
	if (actions > 1) {
		if (node.g > move){
			node.color = c_yellow;
		}else{
			node.color = c_aqua;
		}
	}else{
		node.color = c_yellow;
	}
}
/// @description Pathfinding
// @arg start Origin node
// @arg move Movement range
// @arg actions Remaining Actions
function movement_range(start, move, actions){
	// reset all node data
	wipe_nodes();
	
	var open, closed;
	var current, neighbor;
	var tempG, range, costMod;
	
	range = move * actions;
	
	open = ds_priority_create();
	closed = ds_list_create();
	
	// add starting node to the open list
	ds_priority_add(open, start, start.g);
	
	// while open queue is NOT empty...
	// repeat the following until ALL nodes have been evaluated
	while(ds_priority_size(open) > 0){
		// remove node with lowest g score from open
		current = ds_priority_delete_min(open);
		
		// add to the closed list
		ds_list_add(closed, current);
		
		// set through current neighbors
		for(var ii = 0; ii < ds_list_size(current.neighbors); ii++){
			// store current neighbor in neighbor variable
			neighbor = ds_list_find_value(current.neighbors, ii);
			
			// add neighbor to open list if...
			// neighbor is passable
			// neighbor has no occupant
			// neighbor's projected g score is less than movement range
			// neighbor isn't ALREADY in the closed list
			
			if(ds_list_find_index(closed, neighbor) < 0
			&& neighbor.passable
			&& neighbor.occupant == noone
			&& (neighbor.cost + current.g) <= range){
				
				// only calculate a new g score for neighbor if it hasn't already been calculated
				if(ds_priority_find_priority(open, neighbor) == 0
				|| ds_priority_find_priority(open, neighbor) == undefined){
					costMod = 1;
					
					// give neighbor the appropriate neighbor
					neighbor.parent = current;
					
					// if node is diagonal, create appropriate costMod
					if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
						costMod = 1.5;
					}
					
					neighbor.g = current.g + (neighbor.cost * costMod);
					
					// add neighbor to open list
					ds_priority_add(open, neighbor, neighbor.g);
				}else{
					// if neighbor's score has already been calculated for the open list
					// figure out if current score will be lower
					costMod = 1;
					
					// if node is diagonal, create appropriate costMod
					if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
						costMod = 1.5;
					}
					
					tempG = current.g + (neighbor.cost * costMod);
					
					// check if g score would be lower
					if(tempG < neighbor.g){
						neighbor.parent = current;
						neighbor.g = tempG;
						ds_priority_change_priority(open, neighbor, neighbor.g);
					}
				}
			}
		}
	}
	
	// round down all g scores for movement
	// with(objNode){
	//	g = floor(g);
	// }
	
	// destroy open
	ds_priority_destroy(open);
	
	// color move nodes then destroy the closed list
	for(var ii = 0; ii < ds_list_size(closed); ii++){
		current = ds_list_find_value(closed, ii);
		current.moveNode = true;
		
		color_move_node(current, move, actions);
	}
	
	start.moveNode = false;
	start.color = c_white;
	
	ds_list_destroy(closed);
	
}