/// @description draw_self

if angle_difference(90,facing) > 0
{
	draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,-1,1);
}
else
{
	draw_sprite_ext(sprite_index,image_index,x,y,-1,1,0,-1,1);
}

draw_sprite(spr_shadowGround,0,x,y+128);