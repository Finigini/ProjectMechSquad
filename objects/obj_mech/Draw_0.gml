/// @description

//testing weapon CDs
//draw_text(x-32,y,string(weaponLeftCD))
//draw_text(x+32,y,string(weaponRightCD))

//draw the mech
scr_drawMech(legsType,bodyType,weaponTypeLeft,weaponTypeRight,weaponFlashLeft,weaponFlashRight,facingLegs,facingBody);
draw_sprite_ext(spr_mechShield,shieldFrame,x,y,1,1,shieldDirection,-1,1);

//while selected
if selected == true
{
	draw_sprite(spr_selected,0,x,y);
	
	//waypoints
	var waypointNum = ds_list_size(waypointsX);
	for(i = 0; i < waypointNum; i++)
	{
		if i == 0
		{
			draw_line_color(x,y,waypointsX[|i],waypointsY[|i],c_lime,c_lime)
		}
		else
		{
			draw_line_color(waypointsX[|(i-1)],waypointsY[|(i-1)],waypointsX[|i],waypointsY[|i],c_lime,c_lime)
		}
	}
	//targets
	if instance_exists(primaryTarget)
	{
		draw_sprite(spr_selectedTarget,0,primaryTarget.x,primaryTarget.y);
	}
}