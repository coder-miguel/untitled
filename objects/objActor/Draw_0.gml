// if cursor is hovering over a different node than actor
if(game_cursor.selected.actor == id){
	
	if(game_cursor.hoverNode != noone){
		var halfGrid = floor(GRID_SIZE / 2);
		var tempNode = game_cursor.hoverNode;
		
		if(tempNode.moveNode){
			var current = tempNode;
			// step through every node in the chain until we reach the actor node
			while(current.parent != noone){
				draw_line_width_color(current.x + halfGrid, current.y + halfGrid,
				current.parent.x + halfGrid, current.parent.y + halfGrid, 4, c_lime, c_lime);
				
				current = current.parent;
			}
		}
		if(tempNode.attackNode){
			switch(atkType){
				case ATTACK_TYPE_RANGED:
					draw_line_width_color(x + halfGrid, y + halfGrid,
					tempNode.x + halfGrid, tempNode.y + halfGrid, 4, c_purple, c_purple);
					break;
			}
		}
	}
}

if(shake > 0){
	draw_sprite_ext(sprite_index, -1,
	x + irandom_range(-shakeMag, shakeMag),
	y + irandom_range(-shakeMag, shakeMag), 1, 1, 0, c_white, 1);
}else{
	draw_self();
}