///scr_mario_swim()

/*
**  Usage:
**      scr_mario_swim()
**
**  Purpose:
**      Calls the appropiate swimming sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_swim;
    case (cs_big): return spr_mario_big_swim;
    case (cs_fire): return spr_mario_fire_swim;
    case (cs_ice): return spr_mario_ice_swim;
    case (cs_carrot): return spr_mario_carrot_swim;
    case (cs_leaf): return spr_mario_raccoon_swim;
    case (cs_frog): {
    
        if (xspeed == 0)
            return spr_mario_frog_swim;
        else
            return spr_mario_frog_swim2;
    }
    case (cs_tanooki): return spr_mario_tanooki_swim;
    case (cs_hammer): return spr_mario_hammer_swim;
    case (cs_boomerang): return spr_mario_boomerang_swim;
    case (cs_super): return spr_mario_super_swim;
    case (cs_bomb): return spr_mario_bomb_swim;
    case (cs_shell): return spr_mario_shell_swim;
    case (cs_bee): return spr_mario_bee_swim;
    case (cs_lightning): return spr_mario_lightning_swim;
    case (cs_penguin): {
    
        if (xspeed == 0)
            return spr_mario_penguin_swim;
        else
            return spr_mario_penguin_swim2;
    }
    case (cs_propeller): return spr_mario_propeller_swim;
    case (cs_cat): return (spr_mario_cat_swim);
    case (cs_football): return spr_mario_football_swim;
}
