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
		var current = hoverNode;
		
		// create priority queue
		var path = ds_priority_create();
		
		// add current node to queue
		ds_priority_add(path, current, current.g);
		
		// step through each node, parent to parent until done
		while(current.parent != noone){
			// add parent to node queue
			ds_priority_add(path, current.parent, current.parent.g);
			// next node
			current = current.parent;
		}
		do{
			// delete lowest priority node (closest to actor)
			current = ds_priority_delete_min(path);
			
			// add current node's sprite coords to selected actor's path
			path_add_point(selected.actor.path, current.x, current.y, 100);
			
		}until(ds_priority_empty(path));
		
		// destroy priority queue
		ds_priority_destroy(path);
		
		// clear node of selected actor
		map[selected.actor.gridX, selected.actor.gridY].occupant = noone;
		
		// update selected actor's appropriate grid coordinates
		selected.actor.gridX = gridX;
		selected.actor.gridY = gridY;
		
		// update selected actor's future node
		hoverNode.occupant = selected.actor;
		
		// send selected actor on its way
		selected.actor.state = ACTOR_BEGIN_PATH;
		
		// TODO:
		// --Replace the 2-action system
		// reduce selected actor's actions and wipe nodes
		if(hoverNode.g > selected.actor.move){
			selected.actor.actions -= 2;
		}else{
			selected.actor.actions -= 1;
		}
		wipe_nodes();
		selected.actor = noone;
		
		// --code end
	}
}