///scr_mario_shoot()

/*
**  Usage:
**      scr_mario_shoot()
**
**  Purpose:
**      Calls the appropiate shooting sprite for Mario.
*/

switch (global.powerup) {

    case (cs_fire): return spr_mario_fire_shoot;
    case (cs_ice): return spr_mario_ice_shoot;
    case (cs_hammer): return spr_mario_hammer_shoot;
    case (cs_boomerang): return spr_mario_boomerang_shoot;
    case (cs_super): return spr_mario_super_shoot;
    case (cs_lightning): return spr_mario_lightning_shoot;
    case (cs_penguin): return spr_mario_penguin_shoot;
}
