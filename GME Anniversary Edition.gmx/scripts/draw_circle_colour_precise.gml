///draw_circle_colour_precise(x,y,radius,color1,color2,outline,precision);

/*
**  Usage:   
**      draw_circle_colour_precise(x,y,radius,color1,color2,outline,precision);
**
**  Arguments:
**      argument0   == x
**      argument1   == y
**      argument2   == radius (In Pixels)
**      argument3   == outline colour
**      argument4   == fill colour
**      argument5   == outline?
**      argument6   == precision (Check 'draw_set_circle_precision' on the Help file for details.)
*/

//Draw the circle
draw_circle_colour(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5]);

//Set up the precision of the previous drawn circle.
draw_set_circle_precision(argument[6]);
