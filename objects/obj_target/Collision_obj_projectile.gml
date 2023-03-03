/// @description get hit

if team != other.team
{
	if team == "bug"
	{
		hp -= other.damage;
	}
	else
	{
		if shield > 0
			{
				shield -= other.damage;
				shieldFrame = 0;
			}
			else
			{
				hull -= other.damage;
			}
	}
	with(other)
	{
		instance_destroy();
	}
}