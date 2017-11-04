///scr_global_jump()

/*
**  Usage:
**      scr_global_jump()
**
**  Purpose:
**      Calls the appropiate jumping sprite for the correct character
*/

switch (global.player) {

    case (0): sprite_index = scr_mario_jump(); break;
}
