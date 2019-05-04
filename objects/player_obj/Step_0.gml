/// @description Insert description here
// You can write your code in this editor

/*if (room != howtoplay_rm)
{
	lives = 1000;
	
}*/

if (run_obj.inAction)
{

if (flTrap && lives == 0)
{
	flEnd = true;
	flDead = true;
	audio_stop_sound(sound_game);
	run_obj.scoring = false;
	if (point_distance(x, y, endTrap.x, endTrap.y) > 0.4) 
		move_towards_point(endTrap.x, endTrap.y, 0.6);
	else instance_destroy();
}
else if (lives <= 0) 
{
	lives = 0;
	flEnd = true;
	flDead = true;
	audio_stop_sound(sound_game);
	run_obj.scoring = false;
	image_alpha = y*y/(storeY*storeY);
	if (point_distance(x, y, x, 0) > 4)
		move_towards_point(x, 0, 4);
	else instance_destroy();
}

if (!flEnd)
{
	
storeY = y;

if (hp <= 0)
{
	if (lives > 1)
	{
		run_obj.spiritHp = run_obj.constHp;
		instance_create_depth(x, y, depth, player_obj);
		instance_destroy();
	}
	--lives;
	audio_play_sound(sound_death, 4, false);
}
else
{
	if (!flStun && !flDead)
	{
		hp -= 1 + keyShift;
		//run_obj.spiritHp -= 1 + keyShift;
		run_obj.spiritHp = hp;
	}
}

if (keyShift)
{
	if (!instance_exists(speed_obj))
		instance_create_depth(x, y, depth-1, speed_obj);
	shieldInst = instance_nearest(x, y, speed_obj);
	shieldInst.x = x;
	shieldInst.y = y;
	if (sprite_index == run_obj.pl_spr_right)
		shieldInst.sprite_index = speed_spr_right;
	else shieldInst.sprite_index = speed_spr_left;
}
else
{
	if (instance_exists(speed_obj))
	{
		shieldInst = instance_nearest(x, y, speed_obj);
		shieldInst.hp = 0;
	}
}


if (place_meeting(x, y, trap_obj))
{
	if (flag) { run_obj.pentagramm_count += 1 }
	flag = false;

	if (!audio_is_playing(sound_pentagram))
		audio_play_sound(sound_pentagram, 3, false);
	flDead = true;
	if (flStun)
	{
		if (place_meeting(x, y, enemy_obj))
		{
			meetEnemy = instance_nearest(x, y, enemy_obj);
			meetEnemy.hp = 0;
		}
		else if (place_meeting(x, y, enemy_mem_obj))
		{
			meetEnemy = instance_nearest(x, y, enemy_mem_obj);
			meetEnemy.hp = 0;
		}
		//meetEnemy = instance_nearest(x, y, enemy_obj);
		//meetEnemy.hp = 0;
		flStun = false;
	}
	endTrap = instance_nearest(x, y, trap_obj);
	if (lives == 1)
	{
		lives = 0;
		flTrap = true;
		audio_play_sound(sound_death, 4, false);
		/*
		audio_stop_sound(sound_game);
		if (!audio_is_playing(sound_death))
			audio_play_sound(sound_death, 4, false);
		run_obj.scoring = false;
		if (point_distance(x, y, endTrap.x, endTrap.y) > 0.4) 
			move_towards_point(endTrap.x, endTrap.y, 0.6);
		else instance_destroy();
		*/
	}
	else
	{
		if (point_distance(x, y, endTrap.x, endTrap.y) > 3) 
			move_towards_point(endTrap.x, endTrap.y, 6);
		else 
		{
			hp = 0;
			endTrap.hp = 0;
		}
	}
} else {flag = true}


if (!flStun && !flDead)
{

if (place_meeting(x, y, enemy_obj) || place_meeting(x, y, enemy_mem_obj))
{
	flMeet = true;
	keyShift = 0;
	if (place_meeting(x, y, enemy_obj))
		meetEnemy = instance_nearest(x, y, enemy_obj);
	else
	{
		meetEnemy = instance_nearest(x, y, enemy_mem_obj);
		flMeetMem = true;
	}
	if (point_distance(x, y, meetEnemy.x, meetEnemy.y) > 4) 
		move_towards_point(meetEnemy.x, meetEnemy.y, 8);
	else if (!keySpace)
	{
		meetEnemy.hp = 0;
		audio_play_sound(sound_in, 3, false);
		instance_create_depth(x, y, depth, player_man_obj);
		run_obj.body_count += 1;
		if (meetEnemy.object_index == enemy_mem_obj) player_man_obj.mem = true;
		instance_destroy();
	}
	else 
	{
		meetEnemy.flMeet = true;
		flStun = true;
		flMeet = false;
		timer = 75;
		speed = 0;
	}
}

if (!flDead && !flMeet && !flStun) {
keyUp = -keyboard_check(ord("W"));
keyLeft = -keyboard_check(ord("A"));
keyDown = keyboard_check(ord("S"));
keyRight = keyboard_check(ord("D"));
keySpace = keyboard_check(vk_space);
keyShift = keyboard_check(vk_shift);

hMove = keyLeft + keyRight;
vMove = keyUp + keyDown;

if (hsp > 0) hsp = min(hsp + 2*hMove - 1, (1+keyShift)*moveSpeed);
else if (hsp < 0) hsp = max(hsp + 2*hMove + 1, -(1+keyShift)*moveSpeed);
else hsp += hMove;
if (vsp > 0) vsp = min(vsp + 2*vMove - 1, (1+keyShift)*moveSpeed);
else if (vsp < 0) vsp = max(vsp + 2*vMove + 1, -(1+keyShift)*moveSpeed);
else vsp += vMove;

if (hMove == 1) sprite_index = run_obj.pl_spr_right;
else if (hMove == -1) sprite_index = run_obj.pl_spr_left;

	x += hsp;
	y += vsp;
	if (x < 32) x = 32;
	if (y < 32+80) y = 32+80;
	if (x > 992) x = 992;
	if (y > 736) y = 736;
}

} //flStun
else
{
	if (flMeetMem)
		meetEnemy = instance_nearest(x, y, enemy_mem_obj);
	else meetEnemy = instance_nearest(x, y, enemy_obj);
	if (meetEnemy == noone || point_distance(x, y, meetEnemy.x, meetEnemy.y) > 4)
	{
		flStun = false;
		flMeetMem = false;
	}
	else
	{
		if (timer == 0)
		{
			meetEnemy.hp = 0;
			flStun = false;
			flMeetMem = false;
			keySpace = 0;
			++lives;
		}
		else 
		{	
			if (place_meeting(x, y, wall_obj)) 
			{
				if (!audio_is_playing(sound_wall_enemy))
					audio_play_sound(sound_wall_enemy, 3, false);
				meetEnemy.hp -= 75;
				meetWall = instance_nearest(x, y, wall_obj);
				meetWall.hp = 0;
			}
			else 
			{
				--timer;
				if (!audio_is_playing(sound_drinking))
					audio_play_sound(sound_drinking, 3, false);
			}
		}
	}
}

} //flEnd

}
else speed = 0;