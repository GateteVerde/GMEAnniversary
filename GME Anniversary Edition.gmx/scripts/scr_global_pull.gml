///scr_global_pull()

/*
**  Usage:
**      scr_global_pull()
**
**  Purpose:
**      Calls the appropiate pull sprite for the player
**
**  Notes:
**      Use only on obj_puller
*/

switch (global.player) {

    //Mario
    case (0): return spr_mario_pull;
}
