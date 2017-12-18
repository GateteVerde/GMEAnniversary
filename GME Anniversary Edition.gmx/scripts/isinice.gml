///isinice()

/*
**  Usage:
**      isinice()
**
**  Purpose:
**      Doubles animation speed when in contact with a slippery surface
*/

if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom,obj_slippery,0,1))
    return 2;
else
    return 1;
