///scr_mario_spin()

/*
**  Usage:
**      scr_mario_spin()
**
**  Purpose:
**      Calls the appropiate spinning sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_spin;
    case (cs_big): return spr_mario_big_spin;
    case (cs_fire): return spr_mario_fire_spin;
    case (cs_ice): return spr_mario_ice_spin;
    case (cs_carrot): return spr_mario_carrot_spin;
    case (cs_leaf): return spr_mario_raccoon_spin;
    case (cs_frog): return spr_mario_frog_spin;
    case (cs_tanooki): return spr_mario_tanooki_spin;
    case (cs_hammer): return spr_mario_hammer_spin;
    case (cs_boomerang): return spr_mario_boomerang_spin;
    case (cs_super): return spr_mario_super_spin;
    case (cs_bomb): return spr_mario_bomb_spin;
    case (cs_shell): return spr_mario_shell_spin;
    case (cs_bee): return spr_mario_bee_spin;
    case (cs_lightning): return spr_mario_lightning_spin;
    case (cs_penguin): return spr_mario_penguin_spin;
    case (cs_propeller): return spr_mario_propeller_spin;
    case (cs_cat): return spr_mario_cat_spin;
    case (cs_football): return spr_mario_football_spin;
}
