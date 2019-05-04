/// @description Insert description here
// You can write your code in this editor
if (instance_exists(shield_obj))
{
	shieldInst = instance_nearest(x, y, shield_obj);
	shieldInst.hp = 0;
}