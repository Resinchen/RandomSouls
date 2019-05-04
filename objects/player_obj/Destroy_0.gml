/// @description Insert description here
// You can write your code in this editor
if (instance_exists(speed_obj))
{
	shieldInst = instance_nearest(x, y, speed_obj);
	shieldInst.hp = 0;
}