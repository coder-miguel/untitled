/// @description Draw Cursor

draw_self();

if(selected.actor != noone){
	var halfGrid = floor(GRID_SIZE / 2);
	var tempText;
	tempText = selected.actor.name + " the " + selected.actor.race + " " + selected.actor.class;
	var tempHP = "HP: " + string(selected.actor.HP) + "/" + string(selected.actor.maxHP);
	var tempHitBonus = "Hit Bonus: " + string(selected.actor.hitBonus);
	
	draw_set_color(c_black);
	draw_rectangle(0, 0, string_width(tempHitBonus), string_height(tempHitBonus), false);
	draw_rectangle(0, halfGrid, string_width(tempHP), halfGrid + string_height(tempHP), false);
	draw_rectangle(0, GRID_SIZE, string_width(tempText), GRID_SIZE + string_height(tempText), false);
	
	draw_set_color(c_white);
	draw_text(0, 0, tempHitBonus);
	draw_text(0, halfGrid, tempHP);
	draw_text(0, GRID_SIZE, tempText);
}