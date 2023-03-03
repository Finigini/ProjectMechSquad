/// @description center camera

if instance_exists(obj_mech)
{
	camera_set_view_pos(view_camera[0],obj_mech.x-cameraWidth/2,obj_mech.y-cameraHeight/2);
}