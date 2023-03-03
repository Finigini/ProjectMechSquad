instance_create_depth(0,0,-100,obj_cursor);

//minimap
#macro TILE_SIZE 32
surfMinimapEntities = -1;

//options
sfxVolume = 0.3;
musicVolume = 1;
cameraSpeed = 20;
//tacticsMode
tacticsMode = false;

//camera
cameraWidth = camera_get_view_width(view_camera[0]);
cameraHeight = camera_get_view_height(view_camera[0]);
//zooming in and out
zoom = 1;
updateZoom = function () 
{
	var base_width = view_wport[0];
	var base_height = view_hport[0];
	var _mouse_x = mouse_x; //Storing the mouse in a var is VERY important in GMS2
	var _mouse_y = mouse_y;
	var _mX = (_mouse_x - camera_get_view_x(view_camera[0])) / camera_get_view_width(view_camera[0]);
	var _mY = (_mouse_y - camera_get_view_y(view_camera[0])) / camera_get_view_height(view_camera[0]);
 
	camera_set_view_size(view_camera[0],base_width / zoom, base_height / zoom);
	var _viewX = (base_width / zoom) * _mX; var _viewY = (base_height / zoom) * _mY;
	camera_set_view_pos(view_camera[0], _mouse_x - _viewX, _mouse_y - _viewY);
}

 updateZoom();
 
 //selected
 selectedUnit = noone;
 selectedTarget = noone;