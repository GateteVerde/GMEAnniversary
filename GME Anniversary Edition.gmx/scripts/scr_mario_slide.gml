///scr_mario_slide()

/*
**  Usage:
**      scr_mario_slide()
**
**  Purpose:
**      Calls the appropiate sliding sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_slide;
    case (cs_big): return spr_mario_big_slide;
    case (cs_fire): return spr_mario_fire_slide;
    case (cs_ice): return spr_mario_ice_slide;
    case (cs_carrot): return spr_mario_carrot_slide;
    case (cs_leaf): return spr_mario_raccoon_slide;
    case (cs_tanooki): return spr_mario_tanooki_slide;
    case (cs_hammer): return spr_mario_hammer_slide;
    case (cs_boomerang): return spr_mario_boomerang_slide;
    case (cs_super): return spr_mario_super_slide;
    case (cs_bomb): return spr_mario_bomb_slide;
    case (cs_shell): return spr_mario_shell_slide;
    case (cs_bee): return spr_mario_bee_slide;
    case (cs_lightning): return spr_mario_lightning_slide;
    case (cs_penguin): return spr_mario_penguin_slide;
    case (cs_propeller): return spr_mario_propeller_slide;
    case (cs_cat): return spr_mario_cat_slide;
    case (cs_football): return spr_mario_football_slide;
}
