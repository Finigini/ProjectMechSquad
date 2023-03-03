/// @description every frame

if room != rm_mainMenu
{
//tactics mode
if keyboard_check_pressed(vk_space)
{
	tacticsMode = !tacticsMode;
}

//camera controls
cameraWidth = camera_get_view_width(view_camera[0]);
cameraHeight = camera_get_view_height(view_camera[0]);
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var camMoveH = keyboard_check(ord("A")) - keyboard_check(ord("D"))
var camMoveV = keyboard_check(ord("W")) - keyboard_check(ord("S"))
var camSpeed = cameraSpeed;
if camMoveH != 0 or camMoveV != 0
{
	camX-=camMoveH*camSpeed;
	camY-=camMoveV*camSpeed;
	camera_set_view_pos(view_camera[0],camX,camY);
}
//moving camera using minimap shit doesn't work idk
var _mx = mouse_x-camX;
var _my = mouse_y-camY;
var _h = (room_height/TILE_SIZE);
var _w = (room_width/TILE_SIZE);
if mouse_check_button(mb_left)
{
	if point_in_rectangle(_mx,_my,x,y,x+_w,y+_h)
	{
		camera_set_view_pos(view_camera[0],(_mx-(camX+16))*TILE_SIZE,(_my-(camY+496))*TILE_SIZE);
	}
}
//zooming in and out
if(mouse_wheel_down()) and zoom > 0.8
{
 zoom -= .1;
 updateZoom();
} else if(mouse_wheel_up()) and zoom < 5
{
 zoom += .1;
 updateZoom();
}

x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2
}
//audio listener
audio_listener_position(x, y, -(500-(zoom*100)));
audio_listener_orientation(0, 0, 1, 0, 1, 0);