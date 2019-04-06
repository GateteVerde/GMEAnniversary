///scr_mario_kick()

/*
**  Usage:
**      scr_mario_kick()
**
**  Purpose:
**      Calls the appropiate kicking sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_kick;
    case (cs_big): return spr_mario_big_kick;
    case (cs_fire): return spr_mario_fire_kick;
    case (cs_ice): return spr_mario_ice_kick;
    case (cs_carrot): return spr_mario_carrot_kick;
    case (cs_leaf): return spr_mario_raccoon_kick;
    case (cs_frog): return spr_mario_frog_kick;
    case (cs_tanooki): return spr_mario_tanooki_kick;
    case (cs_hammer): return spr_mario_hammer_kick;
    case (cs_boomerang): return spr_mario_boomerang_kick;
    case (cs_super): return spr_mario_super_kick;
    case (cs_bomb): return spr_mario_bomb_kick;
    case (cs_shell): return spr_mario_shell_kick;
    case (cs_bee): return spr_mario_bee_kick;
    case (cs_lightning): return spr_mario_lightning_kick;
    case (cs_penguin): return spr_mario_penguin_kick;
    case (cs_propeller): return spr_mario_propeller_kick;
    case (cs_cat): return spr_mario_cat_kick;
    case (cs_football): return spr_mario_football_kick;
}
