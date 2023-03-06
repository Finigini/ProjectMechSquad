/// @description every frame
audio_emitter_position(emitter, x, y, 0);

if obj_control.tacticsMode == false
{
	//projectile aggro
	var nearestProjectile = instance_nearest(x,y,obj_projectile)
	if distance_to_object(nearestProjectile) < 100
	{
		target = nearestProjectile.source;
	}
	//pursue target
	var nearestTarget = instance_nearest(x,y,obj_mech)
	if distance_to_object(nearestTarget) > shootRange and distance_to_object(nearestTarget) < agroRange
	and target == noone
	{
		mp_potential_step_object(nearestTarget.x,nearestTarget.y,moveSpeed,obj_solidSky);
		moving = true;
	}
	else if instance_exists(target) and distance_to_object(nearestTarget) > shootRange
	{
		mp_potential_step_object(target.x,target.y,moveSpeed,obj_solidSky);
		//facing = point_direction(x,y,target.x,target.y);
		moving = true;
	}
	else
	{
		moving = false;
	}

	if instance_exists(nearestTarget) and distance_to_object(nearestTarget) <= shootRange
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
		with(instance_create_depth(x,y+128,0,obj_miteCorpse))
		{
			image_angle = other.facing;
		}
		instance_destroy();
	}
	
	//attacking
	attackCD -= 1;
	if instance_exists(nearestTarget)
	{
		if distance_to_object(nearestTarget) <= shootRange
		and attackCD <= 0
		{
			attackCD = attackSpeed;
			with(instance_create_depth(x,y,0,obj_projectile))
			{
				airborne = true;
				canHitGround = true;
				projectileSpeed = 7;
				lifeTime = 60;
				team = other.team;
				source = other;
				damage = other.attackDamage;
				sprite_index = spr_stinger;
				direction = point_direction(x,y,nearestTarget.x,nearestTarget.y);
			}
		}
	}
	image_speed = 1;
}
else
{
	image_speed = 0;
}