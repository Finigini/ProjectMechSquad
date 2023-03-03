// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fireWeapons()
{
	var cannonCD = 30;
	var cannonSpread = 5;
	var cannonDamage = 3;
	var scattergunCD = 80;
	var scattergunSpread = 20;
	var scattergunDamage = 5;
	//weaponCD
	if weaponLeftCD > 0
	{
		weaponLeftCD -= 1;
	}
	if weaponRightCD > 0
	{
		weaponRightCD -= 1;
	}
	if weaponLeftCD <= 0
	{
		//cannon
		if weaponTypeLeft == spr_mechWeaponCannon
		{
			weaponLeftCD = cannonCD;
			if weaponTypeRight == spr_mechWeaponCannon
			{
				weaponRightCD = cannonCD/2;
			}
			weaponEffectLeft = 1;
			audio_sound_pitch(sou_cannon,choose(1,1.1,0.9))
			scr_playSoundSpatial(emitter,sou_cannon);
			with(instance_create_depth(x,y,-10,obj_projectile))
			{
				team = other.team;
				airborne = other.primaryTarget.airborne;
				source = other.id;
				damage = cannonDamage;
				projectileSpeed = 20;
				direction = point_direction(other.x,other.y,other.primaryTarget.x,other.primaryTarget.y)+cannonSpread-random(cannonSpread*2);
				image_angle = direction;
			}
		}
		//scattergun
		if weaponTypeLeft == spr_mechWeaponScattergun
		{
			weaponLeftCD = scattergunCD;
			weaponEffectLeft = 1;
			audio_sound_pitch(sou_cannon,choose(0.8,0.7,0.9))
			scr_playSoundSpatial(emitter,sou_scattergun);
			for(i = 0; i<5; i++)
			{
				with(instance_create_depth(x,y,-10,obj_projectile))
				{
					team = other.team;
					airborne = other.primaryTarget.airborne;
					source = other.id;
					damage = scattergunDamage;
					projectileSpeed = 20;
					direction = point_direction(other.x,other.y,other.primaryTarget.x,other.primaryTarget.y)+scattergunSpread-random(scattergunSpread*2);
					image_angle = direction;
				}
			}
		}
	}
	if weaponRightCD <= 0
	{
		//cannon
		if weaponTypeRight == spr_mechWeaponCannon
		{
			weaponRightCD = cannonCD;
			weaponEffectRight = 1;
			audio_sound_pitch(sou_cannon,choose(1,1.1,0.9))
			scr_playSoundSpatial(emitter,sou_cannon);
			with(instance_create_depth(x,y,-10,obj_projectile))
			{
				team = other.team;
				airborne = other.primaryTarget.airborne;
				source = other.id;
				damage = cannonDamage;
				projectileSpeed = 20;
				direction = point_direction(other.x,other.y,other.primaryTarget.x,other.primaryTarget.y)+cannonSpread-random(cannonSpread*2);
				image_angle = direction;
			}
		}
		//scattergun
		if weaponTypeRight == spr_mechWeaponScattergun
		{
			weaponRightCD = scattergunCD;
			weaponEffectRight = 1;
			audio_sound_pitch(sou_cannon,choose(0.8,0.7,0.9))
			scr_playSoundSpatial(emitter,sou_scattergun);
			for(i = 0; i<5; i++)
			{
				with(instance_create_depth(x,y,-10,obj_projectile))
				{
					team = other.team;
					airborne = other.primaryTarget.airborne;
					source = other.id;
					damage = scattergunDamage;
					projectileSpeed = 20;
					direction = point_direction(other.x,other.y,other.primaryTarget.x,other.primaryTarget.y)+scattergunSpread-random(scattergunSpread*2);
					image_angle = direction;
				}
			}
		}
	}
}