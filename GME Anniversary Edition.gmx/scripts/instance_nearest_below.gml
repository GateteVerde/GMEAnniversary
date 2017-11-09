///instance_nearest_below(x, y, obj)

/*  
//  Usage:
//      instance_nearest_below(x, y, obj);
//
//  Arguments:
//      x: X position to check
//      y: Y position to check
//      obj: Object to check
//  
//  Purpose: 
//      The instance id of the object
//      that is nearest to the provided x and
//      y coordinates and is below the coordinates
//      on the y-plane.
*/  

var xx = argument0;
var yy = argument1;
var obj = argument2;
var dis;
var nearest_dis = 999999;
var nearest_id = noone;

with (obj) {
    if (y > yy) {
        dis = point_distance(x, y, xx, yy);
        if (dis < nearest_dis) {
            nearest_dis = dis;
            nearest_id = id;
        }
    }
}

return nearest_id;
