///scr_mario_duck()

/*
**  Usage:
**      scr_mario_duck()
**
**  Purpose:
**      Calls the appropiate ducking sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_duck;
    case (cs_big): return spr_mario_big_duck;
    case (cs_fire): return spr_mario_fire_duck;
    case (cs_ice): return spr_mario_ice_duck;
    case (cs_carrot): return spr_mario_carrot_duck;
    case (cs_leaf): return spr_mario_raccoon_duck;
    case (cs_frog): return spr_mario_frog_duck;
    case (cs_tanooki): return spr_mario_tanooki_duck;
    case (cs_hammer): return spr_mario_hammer_duck;
    case (cs_boomerang): return spr_mario_boomerang_duck;
    case (cs_super): return spr_mario_super_duck;
    case (cs_bomb): return spr_mario_bomb_duck;
    case (cs_shell): return spr_mario_shell_duck;
    case (cs_bee): return spr_mario_bee_duck;
    case (cs_lightning): return spr_mario_lightning_duck;
    case (cs_penguin): return spr_mario_penguin_duck;
    case (cs_propeller): return spr_mario_propeller_duck;
    case (cs_cat): return spr_mario_cat_duck;
    case (cs_football): return spr_mario_football_duck;
}
