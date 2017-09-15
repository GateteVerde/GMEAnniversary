///scr_mario_swim3()

/*
**  Usage:
**      scr_mario_swim3()
**
**  Purpose:
**      Calls the appropiate swimming downwards sprite for Mario.
*/

switch (global.powerup) {

    case (cs_frog): return spr_mario_frog_swim4;
    case (cs_penguin): return spr_mario_penguin_swim4;
}
