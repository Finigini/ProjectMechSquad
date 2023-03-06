/// @description actionmode

if obj_control.tacticsMode == true
{
	speed = 0;
}
else
{
	speed = projectileSpeed;
	if lifeTime > 0
	{
		lifeTime -= 1;
	}
	else
	{
		instance_destroy();
	}
}

image_angle = direction;