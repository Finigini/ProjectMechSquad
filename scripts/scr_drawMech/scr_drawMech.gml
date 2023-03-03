// draw the mech using the sprite data
function scr_drawMech(legSprite,bodySprite,weaponLeft,weaponRight,weaponFlashLeft,weaponFlashRight,rotationLegs,rotationBody)
{
	var legSpriteSize = sprite_get_number(legSprite);
	var bodySpriteSize = sprite_get_number(bodySprite);
	for(i = 0; i<legSpriteSize; i++)
	{
		draw_sprite_ext(legSprite,i,x,y-i,1,1,rotationLegs,-1,1);
	}
	for(i = 0; i<bodySpriteSize; i++)
	{
		draw_sprite_ext(bodySprite,i,x,y-legSpriteSize-i,1,1,rotationBody,-1,1);
		if i == 1
		{
			//weaponEffects
			if weaponLeft != "none"
			{
				draw_sprite_ext(weaponLeft,0,x,y-legSpriteSize-i,1,1,rotationBody,-1,1);
				draw_sprite_ext(weaponFlashLeft,0,x,y-legSpriteSize-i,1,1,facingBody,-1,weaponEffectLeft);
			}
			if weaponRight != "none"
			{
				draw_sprite_ext(weaponRight,1,x,y-legSpriteSize-i,1,1,rotationBody,-1,1);
				draw_sprite_ext(weaponFlashRight,1,x,y-legSpriteSize-i,1,1,facingBody,-1,weaponEffectRight);
			}
		}
	}
}