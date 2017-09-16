///draw_background_tiled_horizontal_ext(back,x,y,xscale,yscale,angle,color,alpha);

/*
**  Usage:   
**      draw_background_tiled_horizontal_ext(back,x,y,xscale,yscale,angle,color,alpha);
**
**  Arguments:
**      argument0   == background
**      argument1   == x
**      argument2   == y
**      argument3   == xscale
**      argument4   == yscale
**      argument5   == angle
**      argument6   == blend color
**      argument7   == alpha
**
**  Returns:
**      A tiled horizontal background that uses 'draw_background_ext' as base.
*/

var back    = argument0;
var xx      = argument1;
var yy      = argument2;
var xscale  = argument3;
var yscale  = argument4;
var rot     = argument5;
var color   = argument6;
var a_trans = argument7;
var width   = background_get_width(back);
var left    = -1;
var right   = view_xview[view_current]/width+view_wview[view_current]/width+1;

if (view_enabled) {

    for (i=left; i<right; i+=1)   
        draw_background_ext(back,xx mod width+width*i,yy,xscale, yscale, rot, color, a_trans);
}
else {

    for (i=-1; i<room_width/width+1; i+=1)
        draw_background_ext(back,xx mod width+width*i,yy,xscale, yscale, rot, color, a_trans);
}
