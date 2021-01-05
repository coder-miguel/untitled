// if cursor is hovering over a different node than actor
if(game_cursor.selected.actor == id){
	if (game_cursor.hoverNode != noone && game_cursor.hoverNode != map[gridX, gridY]){
		var current = game_cursor.hoverNode;
	
		// step through every node in the chain until we reach the actor node
		while(current.parent != noone){
			draw_line_width_color(current.x + 16, current.y + 16,
				current.parent.x + 16, current.parent.y + 16, 4, c_lime, c_lime);
		
			current = current.parent;
		}
	}
}

draw_self();