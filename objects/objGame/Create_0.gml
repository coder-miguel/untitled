/// @description Initialize
globalvar map;
globalvar game;
globalvar game_cursor;

randomize();
draw_set_font(fntDefault);

game = id;
game_cursor = instance_create_depth(0, 0, DEPTH_CURSOR, objCursor);


mapWidth = room_width/GRID_SIZE;
mapHeight = room_height/GRID_SIZE;
state = GAME_INITIALIZING;
turnOrder = ds_list_create();

// create nodes
for(var xx = 0; xx < mapWidth; xx++){
	for(var yy = 0; yy < mapHeight; yy++){
		map[xx, yy] = instance_create_layer(xx * GRID_SIZE, yy * GRID_SIZE, "Instances", objNode);
		map[xx, yy].x = xx * GRID_SIZE;
		map[xx, yy].y = yy * GRID_SIZE;
		map[xx, yy].gridX = xx;
		map[xx, yy].gridY = yy;
	}
}

// populate neighbors
for(var xx = 0; xx < mapWidth; xx++) {
	for(var yy = 0; yy < mapHeight; yy++) {
		node = map[xx, yy];
		
		// add left neighbor
		if(xx > 0            ){
			ds_list_add(node.neighbors, map[xx - 1, yy]);
		}
		// add right neighbor
		if(xx < mapWidth - 1 ){
			ds_list_add(node.neighbors, map[xx + 1, yy]);
		}
		// add top neighbor
		if(yy > 0            ){
			ds_list_add(node.neighbors, map[xx, yy - 1]);
		}
		// add bottom neighbor
		if(yy < mapHeight - 1){
			ds_list_add(node.neighbors, map[xx, yy + 1]);
		}
		//// add top left neighbor
		//if(xx > 0             &&  yy > 0){
		//	ds_list_add(node.neighbors, map[xx - 1, yy - 1]);
		//}
		//// add top right neighbor
		//if(xx < mapWidth - 1  &&  yy > 0){
		//	ds_list_add(node.neighbors, map[xx + 1, yy - 1]);
		//}
		//// add bottom left neighbor
		//if(xx > 0             &&  yy < mapHeight - 1){
		//	ds_list_add(node.neighbors, map[xx - 1, yy + 1]);
		//}
		//// add bottom right neighbor
		//if(xx < mapWidth - 1  &&  yy < mapHeight - 1){
		//	ds_list_add(node.neighbors, map[xx + 1, yy + 1]);
		//}
	}
}