///scr_mario_walk()

/*
**  Usage:
**      scr_mario_walk()
**
**  Purpose:
**      Calls the appropiate walking sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_walk;
    case (cs_big): return spr_mario_big_walk;
    case (cs_fire): return spr_mario_fire_walk;
    case (cs_ice): return spr_mario_ice_walk;
    case (cs_carrot): return spr_mario_carrot_walk;
    case (cs_leaf): return spr_mario_raccoon_walk;
    case (cs_frog): return spr_mario_frog_walk;
    case (cs_tanooki): return spr_mario_tanooki_walk;
    case (cs_hammer): return spr_mario_hammer_walk;
    case (cs_boomerang): return spr_mario_boomerang_walk;
    case (cs_super): return spr_mario_super_walk;
    case (cs_bomb): return spr_mario_bomb_walk;
    case (cs_shell): return spr_mario_shell_walk;
    case (cs_bee): return spr_mario_bee_walk;
    case (cs_lightning): return spr_mario_lightning_walk;
    case (cs_penguin): return spr_mario_penguin_walk;
    case (cs_propeller): return spr_mario_propeller_walk;
    case (cs_cat): return spr_mario_cat_walk;
    case (cs_football): return spr_mario_football_walk;
}
