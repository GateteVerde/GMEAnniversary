///scr_global_wallrun()

/*
**  Usage:
**      scr_global_wallrun()
**
**  Purpose:
**      Calls the appropiate running sprite for the player
**
**  Notes:
**      Use only on obj_wallrunner
*/

switch (global.player) {

    //Mario
    case (0): sprite_index = scr_mario_run(); break;
}
