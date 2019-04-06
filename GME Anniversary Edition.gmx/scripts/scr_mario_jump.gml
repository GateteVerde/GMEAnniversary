///scr_mario_jump()

/*
**  Usage:
**      scr_mario_jump()
**
**  Purpose:
**      Calls the appropiate jumping sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_jump;
    case (cs_big): return spr_mario_big_jump;
    case (cs_fire): return spr_mario_fire_jump;
    case (cs_ice): return spr_mario_ice_jump;
    case (cs_carrot): return spr_mario_carrot_jump;
    case (cs_leaf): return spr_mario_raccoon_jump;
    case (cs_frog): return spr_mario_frog_walk;
    case (cs_tanooki): return spr_mario_tanooki_jump;
    case (cs_hammer): return spr_mario_hammer_jump;
    case (cs_boomerang): return spr_mario_boomerang_jump;
    case (cs_super): return spr_mario_super_jump;
    case (cs_bomb): return spr_mario_bomb_jump;
    case (cs_shell): return spr_mario_shell_jump;
    case (cs_bee): return spr_mario_bee_jump;
    case (cs_lightning): return spr_mario_lightning_jump;
    case (cs_penguin): return spr_mario_penguin_jump;
    case (cs_propeller): return spr_mario_propeller_jump;
    case (cs_cat): return spr_mario_cat_jump;
    case (cs_football): return spr_mario_football_jump;
}
