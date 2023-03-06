/// @description
audio_emitter_position(emitter, x, y, 0);

var mouseX = mouse_x;
var mouseY = mouse_y;

//control if on team
if team == "player"
{
	//select
	if mouse_check_button_released(mb_left)
	{
		if collision_point(mouseX,mouseY,self,true,false)
		{
			selected = true
		}
		else if instance_exists(obj_control)
		{
			selected = false;
			obj_control.selectedUnit = noone;
			obj_control.selectedTarget = noone;
		}
	}

	//while selected--------------------
	//giving commands
	if mouse_check_button_released(mb_right) and selected == true
	{
		if keyboard_check(vk_shift)
		{
			ds_list_add(waypointsX,mouseX);
			ds_list_add(waypointsY,mouseY);
		}
		else if collision_point(mouseX,mouseY,obj_target,true,false)
		and instance_position(mouseX,mouseY,obj_target).team != team
		{
			primaryTarget = instance_position(mouseX,mouseY,obj_target)
		}
		else if collision_point(mouseX,mouseY,obj_targetSky,true,false)
		and instance_position(mouseX,mouseY,obj_targetSky).team != team
		{
			primaryTarget = instance_position(mouseX,mouseY,obj_targetSky)
		}
		else
		{
			ds_list_clear(waypointsX);
			ds_list_clear(waypointsY);
			waypointsX[|0] = mouseX;
			waypointsY[|0] = mouseY;
			primaryTarget = noone;
		}
	}
}


//movement and actions------------------------------
if obj_control.tacticsMode == false
{
	//behavior when not on team
	//retaliate against enemy projectiles
	if team != "player"
	{
		var nearestProjectile = instance_nearest(x,y,obj_projectile)
		if distance_to_object(nearestProjectile) < 100
		{
			var _chance = random(100);
			if primaryTarget == noone or _chance > 90
			{
				if nearestProjectile.source.team != team
				{
					primaryTarget = nearestProjectile.source;
				}
			}
		}
	}
	//end non-team behavior
	
	//weaponEffect
	if weaponEffectLeft > 0
	{
		weaponEffectLeft -= 0.15;
	}
	if weaponEffectRight > 0
	{
		weaponEffectRight -= 0.15;
	}
	//movement
	var wayX = waypointsX[|0]
	var wayY = waypointsY[|0]
	if ds_list_size(waypointsX) > 0
	{
		if abs(angle_difference(point_direction(x,y,wayX,wayY), facingLegs)) > 15
		{
			speed = 0;
			facingLegs += sign(angle_difference(point_direction(x,y,wayX,wayY), facingLegs))*turnspeed;
		}
		else
		{
			if distance_to_point(wayX,wayY) > 1
			{
				moving = true
				mp_potential_step_object(wayX,wayY,movespeed,obj_solid);
			}
			else if distance_to_point(wayX,wayY) <= 1
			{
				ds_list_delete(waypointsX,0);
				ds_list_delete(waypointsY,0);
			}
		}
	}
	else
	{
		speed = 0;
	}
	//enemy targeting
	var _targetNearest = noone;
	var _maxTargetDist = targetingRange;
	if instance_exists(primaryTarget)
	{
		//turn towards enemy
		if abs(angle_difference(point_direction(x,y,primaryTarget.x,primaryTarget.y), facingBody)) > 5
		{
			facingBody += sign(angle_difference(point_direction(x,y,primaryTarget.x,primaryTarget.y), facingBody))*turnspeed;
		}
		else
		{
			//fire at enemey
			scr_fireWeapons();
		}
	}
	else
	{
		with (obj_target) 
		{
			if (team != other.team) 
			{
				var dis = point_distance(x, y, other.x, other.y);
				if (dis < _maxTargetDist) 
				{
					_targetNearest = id;
					_maxTargetDist = dis;
					other.primaryTarget = _targetNearest;
				}
			}
		}
		with (obj_targetSky) 
		{
			if (team != other.team) 
			{
				var dis = point_distance(x, y, other.x, other.y);
				if (dis < _maxTargetDist) 
				{
					_targetNearest = id;
					_maxTargetDist = dis;
					other.primaryTarget = _targetNearest;
				}
			}
		}
		if _targetNearest == noone
		{
			primaryTarget = noone;
			if abs(angle_difference(facingLegs, facingBody)) > 5
			{
				facingBody += sign(angle_difference(facingLegs,facingBody))*turnspeed;
			}
		}
	}
	//dying
	if hull <= 0
	{
		instance_create_depth(x,y,-100,obj_explosion);
		instance_create_depth(x,y,0,obj_mechWreckage);
		instance_destroy();
	}
	//shield animation
	if shieldFrame < 14
	{
		shieldFrame = clamp(shieldFrame+1,0,14);
	}
}
else
{
	speed = 0;
}

//selected display
if instance_exists(obj_control) and selected == true
{
	obj_control.selectedUnit = self;
	if instance_exists(primaryTarget)
	{
		obj_control.selectedTarget = primaryTarget;
	}
}

//calculating stats
movespeed = clamp(movespeedBase-(movespeedBase*((weightTotal/weightCapacity)-1)),0,movespeedBase*1.2);
turnspeed = clamp(turnspeedBase-(turnspeedBase*((weightTotal/weightCapacity)-1)),0,turnspeedBase*1.2);