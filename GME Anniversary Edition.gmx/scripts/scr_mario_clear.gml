///scr_mario_clear()

/*
**  Usage:
**      scr_mario_clear()
**
**  Purpose:
**      Calls the appropiate clearing sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_clear;
    case (cs_big): return spr_mario_big_clear;
    case (cs_fire): return spr_mario_fire_clear;
    case (cs_ice): return spr_mario_ice_clear;
    case (cs_carrot): return spr_mario_carrot_clear;
    case (cs_leaf): return spr_mario_raccoon_clear;
    case (cs_frog): return spr_mario_frog_clear;
    case (cs_tanooki): return spr_mario_tanooki_clear;
    case (cs_hammer): return spr_mario_hammer_clear;
    case (cs_boomerang): return spr_mario_boomerang_clear;
    case (cs_super): return spr_mario_super_clear;
    case (cs_bomb): return spr_mario_bomb_clear;
    case (cs_shell): return spr_mario_shell_clear;
    case (cs_bee): return spr_mario_bee_clear;
    case (cs_lightning): return spr_mario_lightning_clear;
    case (cs_penguin): return spr_mario_penguin_clear;
    case (cs_propeller): return spr_mario_propeller_clear;
    case (cs_cat): return spr_mario_cat_clear;
    case (cs_football): return spr_mario_football_clear;
}
