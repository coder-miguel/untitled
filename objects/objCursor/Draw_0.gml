/// @description Draw Cursor
if(hoverButton && buttonTimer > 15){
	var tempTitle = hoverButton.title;
	var tempText = hoverButton.text;
	draw_set_font(fntCrit);
	var heightY = string_height(tempTitle) + string_height(tempText);
	draw_set_color(c_black);
	draw_rectangle(x + 20, y - heightY, x + 20 + string_width(tempTitle), y - heightY + string_height(tempTitle), false);
	draw_set_color(c_white);
	draw_text(x + 20, y - heightY, tempTitle);
	draw_set_font(fntDefault);
	draw_set_color(c_black);
	draw_rectangle(x + 20, y - string_height(tempText), x + 20 + string_width(tempText), y, false);
	draw_set_color(c_white);
	draw_text(x + 20, y - string_height(tempText), tempText);
}
draw_self();

if(selected.actor){
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