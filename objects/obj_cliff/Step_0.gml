/// @description Insert description here
// You can write your code in this editor

	if place_meeting(x+16,y,obj_cliff)
	{
		tileRight = 1;
	}
	else
	{
		tileRight = 0;
	}
	if place_meeting(x-16,y,obj_cliff)
	{
		tileLeft = 1;
	}
	else
	{
		tileLeft = 0;
	}
	if place_meeting(x,y+16,obj_cliff)
	{
		tileDown = 1;
	}
	else
	{
		tileDown = 0;
	}
	if place_meeting(x,y-16,obj_cliff)
	{
		tileUp = 1;
	}
	else
	{
		tileUp = 0;
	}

image_index = 1*tileRight + 2*tileUp + 4*tileLeft + 8*tileDown; //16 tile autotile 0-15