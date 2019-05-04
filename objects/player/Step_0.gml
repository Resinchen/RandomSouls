/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(ord("W"))) {
	image_angle += 5;
	//phy_position_y += 4;
}
if(keyboard_check(ord("S"))) {
	phy_position_y -= 4;
}
if(keyboard_check(ord("A"))) {
	phy_position_x += 4;
}
if(keyboard_check(ord("D"))) {
	phy_position_x += 4;
}