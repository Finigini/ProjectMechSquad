/// @description

if obj_control.tacticsMode == false
{
	spawnTimeLeft -= 1;
}

if spawnTimeLeft <= 0 and !place_meeting(x,y,obj_solid)
and count > 0
{
	count -= 1;
	instance_create_depth(x,y,0,choose(obj_enemyCrawler,obj_enemyMite));
	if spawnTime > 30
	{
		spawnTime -= 30;
	}
	spawnTimeLeft = spawnTime;
}