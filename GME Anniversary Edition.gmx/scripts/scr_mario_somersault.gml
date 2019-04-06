///scr_mario_somersault()

/*
**  Usage:
**      scr_mario_somersault()
**
**  Purpose:
**      Calls the appropiate somersault sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_somersault;
    case (cs_big): return spr_mario_big_somersault;
    case (cs_fire): return spr_mario_fire_somersault;
    case (cs_ice): return spr_mario_ice_somersault;
    case (cs_carrot): return spr_mario_carrot_somersault;
    case (cs_leaf): return spr_mario_raccoon_somersault;
    case (cs_frog): return spr_mario_frog_somersault;
    case (cs_tanooki): return spr_mario_tanooki_somersault;
    case (cs_hammer): return spr_mario_hammer_somersault;
    case (cs_boomerang): return spr_mario_boomerang_somersault;
    case (cs_super): return spr_mario_super_somersault;
    case (cs_bomb): return spr_mario_bomb_somersault;
    case (cs_shell): return spr_mario_shell_somersault;
    case (cs_bee): return spr_mario_bee_somersault;
    case (cs_lightning): return spr_mario_lightning_somersault;
    case (cs_penguin): return spr_mario_penguin_somersault;
    case (cs_propeller): return spr_mario_propeller_somersault;
    case (cs_cat): return spr_mario_cat_somersault;
    case (cs_football): return spr_mario_football_somersault;
}
