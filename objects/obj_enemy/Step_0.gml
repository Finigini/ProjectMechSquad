/// @description every frame
audio_emitter_position(emitter, x, y, 0);

if obj_control.tacticsMode == false
{
	//projectile aggro
	var nearestProjectile = instance_nearest(x,y,obj_projectile)
	if distance_to_object(nearestProjectile) < 100
	{
		if nearestProjectile.source.team != team
		{
			target = nearestProjectile.source;
		}
	}
	//pursue target
	var nearestTarget = instance_nearest(x,y,obj_mech)
	if distance_to_object(nearestTarget) > 5 and distance_to_object(nearestTarget) < agroRange
	and target == noone
	{
		mp_potential_step_object(nearestTarget.x,nearestTarget.y,moveSpeed,obj_solid)
		moving = true;
	}
	else if instance_exists(target)
	{
		mp_potential_step_object(target.x,target.y,moveSpeed,obj_solid)
		//facing = point_direction(x,y,target.x,target.y);
		moving = true;
	}
	else
	{
		moving = false;
	}

	if instance_exists(nearestTarget) and distance_to_object(nearestTarget) <= 5
	{
		facing = point_direction(x,y,nearestTarget.x,nearestTarget.y);
	}
	else
	{
		facing = direction;
	}
	
	//dying
	if hp <= 0
	{
		instance_change(obj_crawlerCorpse,true);
	}
	
	//attacking
	attackCD -= 1;
	if instance_exists(nearestTarget)
	{
		if distance_to_object(nearestTarget) <= 5 
		and attackCD <= 0
		{
			attackCD = attackSpeed;
			if nearestTarget.shield > 0
			{
				nearestTarget.shield -= attackDamage;
				nearestTarget.shieldFrame = 0;
			}
			else
			{
				nearestTarget.hull -= attackDamage;
			}
			audio_sound_pitch(sou_crawlerAttack,choose(1,1.1,0.9));
			audio_sound_pitch(sou_mechDamaged,choose(1,1.1,0.9));
			scr_playSoundSpatial(emitter,sou_crawlerAttack);
			scr_playSoundSpatial(emitter,sou_mechDamaged);
		}
	}
	//animation
	if moving == true
	{
		image_speed = 1;
	}
	else
	{
		image_speed = 0
	}
}
else
{
	image_speed = 0;
}