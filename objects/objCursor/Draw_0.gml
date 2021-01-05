/// @description Draw Cursor
if(hoverNode != noone){
	//draw_sprite(sprSelected, -1, gridX * GRID_SIZE, gridY * GRID_SIZE);
	selected.x = gridX * GRID_SIZE;
	selected.y = gridY * GRID_SIZE;
}
draw_self();

if(hoverNode != noone){
	tempText = "[" + string_format(gridX, 2, 0) + "," + string_format(gridY, 2, 0) + "]: ";
	if(hoverNode.occupant != noone){
		tempText += hoverNode.occupant.name;
	}else{
		tempText += "noone";
	}
	draw_set_color(c_black);
	draw_rectangle(0, 0, string_width(tempText), string_height(tempText), false);
	
	draw_set_color(c_white);
	draw_text(0, 0, tempText);
	
	tempText = hoverNode.type;
	if(hoverNode.passable){
		tempText += " passable, cost = " + string(hoverNode.cost);
	}
	draw_set_color(c_black);
	draw_rectangle(0, 20, string_width(tempText), 20 + string_height(tempText), false);
	
	draw_set_color(c_white);
	draw_text(0, 20, tempText);
}

if(selected.actor != noone){
	tempText = selected.actor.name;
	
	draw_set_color(c_black);
	draw_rectangle(0, room_height, string_width(tempText), room_height - string_height(tempText), false);
	
	draw_set_color(c_white);
	draw_text(0, room_height - string_height(tempText), tempText);
}