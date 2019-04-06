///scr_mario_ride()

/*
**  Usage:
**      scr_mario_ride()
**
**  Purpose:
**      Calls the appropiate riding sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_ride;
    case (cs_big): return spr_mario_big_ride;
    case (cs_fire): return spr_mario_fire_ride;
    case (cs_ice): return spr_mario_ice_ride;
    case (cs_carrot): return spr_mario_carrot_ride;
    case (cs_leaf): return spr_mario_raccoon_ride;
    case (cs_frog): return spr_mario_frog_ride;
    case (cs_tanooki): return spr_mario_tanooki_ride;
    case (cs_hammer): return spr_mario_hammer_ride;
    case (cs_boomerang): return spr_mario_boomerang_ride;
    case (cs_super): return spr_mario_super_ride;
    case (cs_bomb): return spr_mario_bomb_ride;
    case (cs_shell): return spr_mario_shell_ride;
    case (cs_bee): return spr_mario_bee_ride;
    case (cs_lightning): return spr_mario_lightning_ride;
    case (cs_penguin): return spr_mario_penguin_ride;
    case (cs_propeller): return spr_mario_propeller_ride;
    case (cs_cat): return spr_mario_cat_ride;
    case (cs_football): return spr_mario_football_ride;
}
