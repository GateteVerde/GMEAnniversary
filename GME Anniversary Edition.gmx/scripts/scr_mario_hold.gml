///scr_mario_hold()

/*
**  Usage:
**      scr_mario_hold()
**
**  Purpose:
**      Calls the appropiate holding sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_hold;
    case (cs_big): return spr_mario_big_hold;
    case (cs_fire): return spr_mario_fire_hold;
    case (cs_ice): return spr_mario_ice_hold;
    case (cs_carrot): {
    
        if (state == 2)
            return spr_mario_carrot_hold_jump;
        else
            return spr_mario_carrot_hold;
    }
    case (cs_leaf): {
    
        if (state == 2)
            return spr_mario_raccoon_hold_jump;
        else
            return spr_mario_raccoon_hold;
    }
    case (cs_frog): return spr_mario_frog_hold;
    case (cs_tanooki): {
    
        if (state == 2)
            return spr_mario_tanooki_hold_jump;
        else
            return spr_mario_tanooki_hold;
    }
    case (cs_hammer): return spr_mario_hammer_hold;
    case (cs_boomerang): return spr_mario_boomerang_hold;
    case (cs_super): return spr_mario_super_hold;
    case (cs_bomb): return spr_mario_bomb_hold;
    case (cs_shell): return spr_mario_shell_hold;
    case (cs_bee): {
    
        if (state == 2)
            return spr_mario_bee_hold_jump;
        else
            return spr_mario_bee_hold;
    }
    case (cs_lightning): return spr_mario_lightning_hold;
    case (cs_penguin): return spr_mario_penguin_hold;
    case (cs_propeller): return spr_mario_propeller_hold;
    case (cs_cat): return spr_mario_cat_hold;
}
