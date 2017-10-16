///canhold()

/*
**  Usage:
**      canhold()
**
**  Returns:
**      Whether or not the player is able to hold an item.
*/

if (keyboard_check(global.controlkey))
&& (global.mount == 0)
&& (obj_playerparent.holding = 0)
&& (obj_playerparent.sliding = 0)
&& (obj_playerparent.disablecontrol = 0)
    return true;
else
    return false;
