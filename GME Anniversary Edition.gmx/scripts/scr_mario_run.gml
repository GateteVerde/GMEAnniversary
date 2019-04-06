///scr_mario_run()

/*
**  Usage:
**      scr_player_run()
**
**  Purpose:
**      Calls the appropiate running sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_run;
    case (cs_big): return spr_mario_big_run;
    case (cs_fire): return spr_mario_fire_run;
    case (cs_ice): return spr_mario_ice_run;
    case (cs_carrot): return spr_mario_carrot_run;
    case (cs_leaf): return spr_mario_raccoon_run;
    case (cs_tanooki): return spr_mario_tanooki_run;
    case (cs_hammer): return spr_mario_hammer_run;
    case (cs_boomerang): return spr_mario_boomerang_run;
    case (cs_super): return spr_mario_super_run;
    case (cs_bomb): return spr_mario_bomb_run;
    case (cs_shell): return spr_mario_shell_run;
    case (cs_bee): return spr_mario_bee_run;
    case (cs_lightning): return spr_mario_lightning_run;
    case (cs_penguin): return spr_mario_penguin_run;
    case (cs_propeller): return spr_mario_propeller_run;
    case (cs_cat): return spr_mario_cat_walk;
    case (cs_football): return spr_mario_football_run;
}
