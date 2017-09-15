///scr_mario_swim2()

/*
**  Usage:
**      scr_mario_swim2()
**
**  Purpose:
**      Calls the appropiate swimming upwards sprite for Mario.
*/

switch (global.powerup) {

    case (cs_frog): return spr_mario_frog_swim3;
    case (cs_penguin): return spr_mario_penguin_swim3;
}
