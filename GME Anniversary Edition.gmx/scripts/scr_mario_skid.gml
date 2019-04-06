///scr_mario_skid()

/*
**  Usage:
**      scr_mario_skid()
**
**  Purpose:
**      Calls the appropiate skidding sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_skid;
    case (cs_big): return spr_mario_big_skid;
    case (cs_fire): return spr_mario_fire_skid;
    case (cs_ice): return spr_mario_ice_skid;
    case (cs_carrot): return spr_mario_carrot_skid;
    case (cs_leaf): return spr_mario_raccoon_skid;
    case (cs_tanooki): return spr_mario_tanooki_skid;
    case (cs_hammer): return spr_mario_hammer_skid;
    case (cs_boomerang): return spr_mario_boomerang_skid;
    case (cs_super): return spr_mario_super_skid;
    case (cs_bomb): return spr_mario_bomb_skid;
    case (cs_shell): return spr_mario_shell_skid;
    case (cs_bee): return spr_mario_bee_skid;
    case (cs_lightning): return spr_mario_lightning_skid;
    case (cs_penguin): return spr_mario_penguin_skid;
    case (cs_propeller): return spr_mario_propeller_skid;
    case (cs_cat): return spr_mario_cat_skid;
    case (cs_football): return spr_mario_football_skid;
}
