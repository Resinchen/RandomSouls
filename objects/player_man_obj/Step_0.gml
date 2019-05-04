/// @description Insert description here
// You can write your code in this editor

if (run_obj.inAction)
{

if (hp <= 0)
{
	if (hp < 0) 
	{
		--lives;
		audio_play_sound(sound_death, 4, false);
	}
	run_obj.manHp = run_obj.constHp;
	audio_play_sound(sound_out, 3, false);
	instance_create_depth(x, y, depth, player_obj);
	instance_destroy();
}
else
{
	if (!keyShift) ++run_obj.spiritHp;
	--hp;
	--run_obj.manHp;
}

if (keyShift)
{
	if (!instance_exists(shield_obj))
		instance_create_depth(x, y, depth-1, shield_obj);
	else
	{
		shieldInst = instance_nearest(x, y, shield_obj);
		shieldInst.x = x;
		shieldInst.y = y;
	}
}
else
{
	if (instance_exists(shield_obj))
	{
		shieldInst = instance_nearest(x, y, shield_obj);
		shieldInst.hp = 0;
	}
}

if (place_meeting(x, y, enemy_obj) || place_meeting(x, y, enemy_mem_obj))
{
	flDead = true;
	if (place_meeting(x, y, enemy_obj))
		meetEnemy = instance_nearest(x, y, enemy_obj);
	else
		meetEnemy = instance_nearest(x, y, enemy_mem_obj);
	if (point_distance(x, y, meetEnemy.x, meetEnemy.y) > 3) 
		move_towards_point(meetEnemy.x, meetEnemy.y, 6);
	else 
	{
		meetEnemy.hp = 0;
		audio_play_sound(sound_out, 3, false);
		hp = -1;
		//instance_create_depth(x, y, depth, player_obj);
		//--lives;
		//audio_play_sound(sound_death, 4, false);
		//instance_destroy();
	}
}

if (room == game_rm)
{	
	if (mem && run_obj.journal < run_obj.journalMax && run_obj.spiritHp == run_obj.constHp)
	{
		run_obj.journal += 1;
		succ = false;
		while (!succ)
		{
		var rand = irandom(10)+1;
		switch(rand) {
			case 1:
				if (run_obj.note1 == 0)
				{
					run_obj.note1 = 1;
					succ = true;
				}
				break;
			case 2:
				if (run_obj.note2 == 0)
				{
					run_obj.note2 = 1;
					succ = true;
				}
				break;
			case 3:
				if (run_obj.note3 == 0)
				{
					run_obj.note3 = 1;
					succ = true;
				}
				break;
			case 4:
				if (run_obj.note4 == 0)
				{
					run_obj.note4 = 1;
					succ = true;
				}
				break;
			case 5:
				if (run_obj.note5 == 0)
				{
					run_obj.note5 = 1;
					succ = true;
				}
				break;
			case 6:
				if (run_obj.note6 == 0)
				{
					run_obj.note6 = 1;
					succ = true;
				}
				break;
			case 7:
				if (run_obj.note7 == 0)
				{
					run_obj.note7 = 1;
					succ = true;
				}
				break;
			case 8:
				if (run_obj.note8 == 0)
				{
					run_obj.note8 = 1;
					succ = true;
				}
				break;
			case 9:
				if (run_obj.note9 == 0)
				{
					run_obj.note9 = 1;
					succ = true;
				}
				break;
			case 10:
				if (run_obj.note10 == 0)
				{
					run_obj.note10 = 1;
					succ = true;
				}
				break;
			case 11:
				if (run_obj.note11 == 0)
				{
					run_obj.note11 = 1;
					succ = true;
				}
				break;
		}
		}
		mem = false;
	}
}

if (place_meeting(x, y, wall_obj))
{
	meetWall = instance_nearest(x, y, wall_obj);
	flMeet = true;
	if (point_distance(x, y, meetWall.x, meetWall.y) > 4) 
		move_towards_point(meetWall.x, meetWall.y, 8);
	else {
		speed = 0;
		meetWall.hp = 0;
		audio_play_sound(sound_wall, 3, false);
		flStun = true;
		timer = 15;
		if (!keyShift)
		{
			hp -= 100;
			run_obj.manHp -= 100;
			timer = 50;
		}
		flMeet = false;
	}
}

if (!flStun)
{


if (!flDead && !flMeet) {
keyUp = -keyboard_check(ord("W"));
keyLeft = -keyboard_check(ord("A"));
keyDown = keyboard_check(ord("S"));
keyRight = keyboard_check(ord("D"));
keySpace = keyboard_check_pressed(vk_space);
keyShift = keyboard_check(vk_shift);

hMove = keyLeft + keyRight;
vMove = keyUp + keyDown;

if (hsp > 0) hsp = min(hsp + 2*hMove - 1, moveSpeed);
else if (hsp < 0) hsp = max(hsp + 2*hMove + 1, -moveSpeed);
else hsp += hMove;
if (vsp > 0) vsp = min(vsp + 2*vMove - 1, moveSpeed);
else if (vsp < 0) vsp = max(vsp + 2*vMove + 1, -moveSpeed);
else vsp += vMove;

if (hMove == 1) sprite_index = run_obj.pl_man_spr_right;
else if (hMove == -1) sprite_index = run_obj.pl_man_spr_left;

if (keySpace)
{
	run_obj.manHp = run_obj.constHp;
	audio_play_sound(sound_out, 3, false);
	instance_create_depth(x, y, depth, player_obj);
	instance_destroy();
}

x += hsp;
y += vsp;
if (x < 32) x = 32;
if (y < 32+80) y = 32+80;
if (x > 992) x = 992;
if (y > 736) y = 736;

}

}
else // к flStun
{
	if (timer == 0) flStun = false;
	else --timer;
}

}
else speed = 0;