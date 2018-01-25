///move_contact_object(dir,maxdist,object)

/*
//  Usage:
//      move_contact_object(dir,maxdist,object)
//
//  Arguments:
//      dir         =    Direction
//      maxdist     =    Max. distance
//      object      =    The object to collide with.   
*/

for (i=0; i<argument[1]; i++;) {

    if (place_meeting(lengthdir_x(i,argument[0]),lengthdir_y(i,argument[0]),argument[2])) || (i == argument[1]) {
    
        x = lengthdir_x(i,argument[0]);
        y = lengthdir_y(i,argument[0]);
        exit;
    }
}
