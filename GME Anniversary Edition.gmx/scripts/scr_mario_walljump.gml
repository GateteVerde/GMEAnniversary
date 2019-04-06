///scr_mario_walljump()

/*
**  Usage:
**      scr_mario_walljump()
**
**  Purpose:
**      Calls the appropiate walljump sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_walljump;
    case (cs_big): return spr_mario_big_walljump;
    case (cs_fire): return spr_mario_fire_walljump;
    case (cs_ice): return spr_mario_ice_walljump;
    case (cs_carrot): return spr_mario_carrot_walljump;
    case (cs_leaf): return spr_mario_raccoon_walljump;
    case (cs_frog): return spr_mario_frog_walljump;
    case (cs_tanooki): return spr_mario_tanooki_walljump;
    case (cs_hammer): return spr_mario_hammer_walljump;
    case (cs_boomerang): return spr_mario_boomerang_walljump;
    case (cs_super): return spr_mario_super_walljump;
    case (cs_bomb): return spr_mario_bomb_walljump;
    case (cs_shell): return spr_mario_shell_walljump;
    case (cs_bee): return spr_mario_bee_walljump;
    case (cs_lightning): return spr_mario_lightning_walljump;
    case (cs_penguin): return spr_mario_penguin_walljump;
    case (cs_propeller): return spr_mario_propeller_walljump;
    case (cs_football): return spr_mario_football_walljump;
}
