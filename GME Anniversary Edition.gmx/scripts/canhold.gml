///canhold()

/*
**  Usage:
**      canhold()
**
**  Returns:
**      Whether or not the player is able to hold an item.
*/

if (keyboard_check(global.controlkey))
&& (instance_exists(obj_playerparent))
&& (global.mount == 0)
&& (obj_playerparent.holding = 0)
&& (obj_playerparent.sliding = 0)
&& (obj_playerparent.wallkick == 0)
&& (obj_playerparent.disablecontrol = 0)
    return true;
else
    return false;
