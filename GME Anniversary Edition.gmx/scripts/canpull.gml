///canpull()

/*
**  Usage:
**      canpull()
**
**  Returns:
**      Whether or not Mario is able to pull up an item.
*/

if (keyboard_check_pressed(global.controlkey))
&& (instance_exists(obj_playerparent))
&& (global.mount == 0)
&& (obj_playerparent.state < 2)
&& (obj_playerparent.holding = 0)
&& (obj_playerparent.sliding = 0)
&& (obj_playerparent.kicking = 0)
&& (obj_playerparent.wallkick == 0)
&& (obj_playerparent.disablecontrol = 0)
    return true;
else
    return false;
