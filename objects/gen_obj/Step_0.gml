/// @description Insert description here
// You can write your code in this editor
if (run_obj.inAction)
{
/*
if (timer == 0)
{
	fchoice = irandom(2);
	switch(fchoice) {
		case 0:
			instance_create_depth(1088, irandom_range(32+80, 734), -1, trap_obj);
			timer = 16+irandom(16) - int64(run_obj.constSpeed/10);
			break;
		case 1:
			instance_create_depth(1088, irandom_range(32+80, 734), -1, enemy_obj);
			timer = 32+irandom(16) - int64(run_obj.constSpeed/10);
			break;
		case 2:
			schoice = irandom_range(32+80, 734);
			thchoice = irandom(1);
			if (thchoice == 0)
			{
				for (var i=schoice;i>32+80;i-=64) 
					instance_create_depth(1088, i, -3, wall_obj);
			}
			else 
			{
				for (var i=schoice;i<734;i+=64) 
					instance_create_depth(1088, i, -3, wall_obj);
			}
			timer = 32+irandom(32) - int64(run_obj.constSpeed/10);
			break;
	}
}
else --timer;
*/

if (trapTimer == 0)
{
	var rand1 = irandom_range(32+80, 736);
	var t = 0;
	while (collision_rectangle(1088-32+t, rand1-32, 1088+32+t, rand1+32, wall_obj, false, false)) t += 64;
	while (collision_rectangle(1088-32+t, rand1-32, 1088+32+t, rand1+32, enemy_obj, false, false)) t += 64;
	instance_create_depth(1088+t, rand1, -1, trap_obj);
	var rand = irandom(16);
	trapTimer = int64((32+32+rand)*4/(run_obj.constSpeed + 4));
}
else --trapTimer;

if (enemyTimer == 0)
{
	var rand1 = irandom_range(32+80, 736);
	var t = 0;
	while (collision_rectangle(1088-32+t, rand1-32, 1088+32+t, rand1+32, wall_obj, false, false)) t += 64;
	while (collision_rectangle(1088-32+t, rand1-32, 1088+32+t, rand1+32, trap_obj, false, false)) t += 64;
	var jourRand = irandom(1000);
	if (jourRand >= int64(score)/4)
		instance_create_depth(1088+t, rand1, -1, enemy_obj);
	else instance_create_depth(1088+t, rand1, -1, enemy_mem_obj);
	var rand = irandom(16);
	enemyTimer = int64((48+32+rand)*4/(run_obj.constSpeed + 4));
}
else --enemyTimer;

if (wallTimer == 0)
{
	var rand1 = irandom_range(32+80, 736);
	choice = irandom(1);
	var t = 0;
	var f = false;
	if (choice == 0)
	{
		while (true)
		{
			var f2 = true;
			if (f)
			{
				for (var i=rand1;i>=32+80-64;i-=64) 
					instance_create_depth(1088+t, i, -3, wall_obj);
				break;
			}
			else
			{
				for (var i=rand1;i>=32+80-64;i-=64)
					if (collision_rectangle(1088-32+t, i-32, 1088+32+t, i+32, trap_obj, false, false) || collision_rectangle(1088-32+t, i-32, 1088+32+t, i+32, enemy_obj, false, false))
					{
						t += 64;
						f2 = false;
						break;
					}
				if (f2) f = true;
			}
		}
	}
	else 
	{
		while (true)
		{
			var f2 = true;
			if (f)
			{
				for (var i=rand1;i<=736+64;i+=64) 
					instance_create_depth(1088+t, i, -3, wall_obj);
				break;
			}
			else
			{
				for (var i=rand1;i<=736+64;i+=64)
					if (collision_rectangle(1088-32+t, i-32, 1088+32+t, i+32, trap_obj, false, false) || collision_rectangle(1088-32+t, i-32, 1088+32+t, i+32, enemy_obj, false, false))
					{
						t += 64;
						f2 = false;
						break;
					}
				if (f2) f = true;
			}
		}
	}
	var rand = irandom(32);
	wallTimer = int64((64+32+rand)*4/(run_obj.constSpeed + 4));
}
else --wallTimer;

}