/// @description draw gui

if room != rm_mainMenu
{
//bottom GUI
draw_set_alpha(0.7);
draw_rectangle_color(0,480,256,640,c_black,c_black,c_black,c_black,false)
draw_rectangle_color(256,512,704,640,c_black,c_black,c_black,c_black,false)
draw_rectangle_color(704,480,960,640,c_black,c_black,c_black,c_black,false)
draw_set_alpha(1);

//minimap
var _h = (room_height/TILE_SIZE);
var _w = (room_width/TILE_SIZE);
var _x = 16;
var _y = 496;
//draw entities
if (!surface_exists(surfMinimapEntities)) surfMinimapEntities = surface_create(_w,_h);
surface_set_target(surfMinimapEntities);
	draw_clear_alpha(c_black,0.0);
	with(obj_target)
	{
		if (entityOnMinimap == true)
		{
			if team == "player"
			{
				draw_sprite_ext(spr_pixel,0,x/TILE_SIZE,y/TILE_SIZE,3,3,0,c_lime,1);
			}
			else
			{
				draw_sprite_ext(spr_pixel,0,x/TILE_SIZE,y/TILE_SIZE,1,1,0,c_red,1);
			}
		}
	}
	with(obj_targetSky)
	{
		if (entityOnMinimap == true)
		{
			if team == "player"
			{
				draw_sprite_ext(spr_pixel,0,x/TILE_SIZE,y/TILE_SIZE,2,2,0,c_lime,1);
			}
			else
			{
				draw_sprite_ext(spr_pixel,0,x/TILE_SIZE,y/TILE_SIZE,1,1,0,c_red,1);
			}
		}
	}
surface_reset_target();
draw_surface(surfMinimapEntities,_x,_y);

//draw camera position
var _vX = camera_get_view_x(view_camera[0])/TILE_SIZE;
var _vY = camera_get_view_y(view_camera[0])/TILE_SIZE;
draw_rectangle(_x+_vX,_y+_vY,_x+_vX+camera_get_view_width(view_camera[0])/TILE_SIZE,_y+_vY+camera_get_view_height(view_camera[0])/TILE_SIZE,true);

//draw border
draw_rectangle(_x,_y,_x+_w,_y+_h,true);

//draw selected unit wireframe and info

//draw selected target wireframe and info
var _frameColor = c_white
var _scribColor = c_white
if instance_exists(selectedUnit)
{
	if selectedUnit.hull > selectedUnit.maxHull*0.75
	{
		_frameColor = c_lime;
		_scribColor = "[c_lime]";
	}
	else if selectedUnit.hull > selectedUnit.maxHull*0.5
	{
		_frameColor = c_yellow;
		_scribColor = "[c_yellow]";
	}
	else
	{
		_frameColor = c_red;
		_scribColor = "[c_red]";
	}
	draw_sprite_ext(selectedUnit.wireframe,0,256,512,1,1,0,_frameColor,1);
	//hull and shields numbers
	draw_text_scribble(256,576,_scribColor+string(selectedUnit.hull)+"/"+string(selectedUnit.maxHull)+" [spr_iconHull][/c]");
	draw_text_scribble(256,592,"[c_white]"+string(selectedUnit.shield)+"/"+string(selectedUnit.maxShield)+" [spr_iconShields][/c]");
	if instance_exists(selectedTarget)
	{
		if selectedTarget.team == "bug"
		{
			if selectedTarget.hp > selectedTarget.maxHp*0.75
			{
				_frameColor = c_lime;
				_scribColor = "[c_lime]";
			}
			else if selectedTarget.hp > selectedTarget.maxHp*0.5
			{
				_frameColor = c_yellow;
				_scribColor = "[c_yellow]";
			}
			else
			{
				_frameColor = c_red;
				_scribColor = "[c_red]";
			}
			//hp numbers
			draw_text_scribble(624,576,_scribColor+string(selectedTarget.hp)+"/"+string(selectedTarget.maxHp)+" [spr_iconHeart][/c]");
		}
		else
		{
			if selectedTarget.hull > selectedTarget.maxHull*0.75
			{
				_frameColor = c_lime;
				_scribColor = "[c_lime]";
			}
			else if selectedTarget.hull > selectedTarget.maxHull*0.5
			{
				_frameColor = c_yellow;
				_scribColor = "[c_yellow]";
			}
			else
			{
				_frameColor = c_red;
				_scribColor = "[c_red]";
			}
			//hull and shield numbers
			draw_text_scribble(624,576,_scribColor+string(selectedTarget.hull)+"/"+string(selectedTarget.maxHull)+" [spr_iconHull][/c]");
			draw_text_scribble(624,592,"[c_white]"+string(selectedTarget.shield)+"/"+string(selectedTarget.maxShield)+" [spr_iconShields][/c]");
		}
		draw_sprite_ext(selectedTarget.wireframe,0,624,512,1,1,0,_frameColor,1);
	}
}

}