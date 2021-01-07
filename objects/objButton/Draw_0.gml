draw_self();

draw_set_font(fntHotkey);
draw_set_color(c_black);
draw_text(x + floor((GRID_SIZE / 4) * 3), y - GRID_SIZE, string(hotKey));
draw_set_font(fntDefault);
draw_set_color(c_white);