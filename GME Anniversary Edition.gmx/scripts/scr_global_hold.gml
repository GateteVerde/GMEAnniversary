///scr_global_hold()

/*
**  Usage:
**      scr_global_hold()
**
**  Purpose:
**      Calls the appropiate holding sprite for the correct character
*/

switch (global.player) {

    case (0): sprite_index = scr_mario_hold(); break;
}
