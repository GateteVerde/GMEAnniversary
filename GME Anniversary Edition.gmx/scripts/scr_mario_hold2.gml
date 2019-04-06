///scr_mario_hold2()

/*
**  Usage:
**      scr_mario_hold2()
**
**  Purpose:
**      Calls the appropiate holding sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_hold2;
    case (cs_big): return spr_mario_big_hold2;
    case (cs_fire): return spr_mario_fire_hold2;
    case (cs_ice): return spr_mario_ice_hold2;
    case (cs_carrot): {
    
        if (instance_exists(obj_playerparent))
        && (obj_playerparent.state == 2)
            return spr_mario_carrot_hold2_jump;
        else
            return spr_mario_carrot_hold2;
    }
    case (cs_leaf): {
    
        if (instance_exists(obj_playerparent))
        && (obj_playerparent.state == 2)
            return spr_mario_raccoon_hold2_jump;
        else
            return spr_mario_raccoon_hold2;
    }
    case (cs_frog): return spr_mario_frog_hold2;
    case (cs_tanooki): {
    
        if (instance_exists(obj_playerparent))
        && (obj_playerparent.state == 2)
            return spr_mario_tanooki_hold2_jump;
        else
            return spr_mario_tanooki_hold2;
    }
    case (cs_hammer): return spr_mario_hammer_hold2;
    case (cs_boomerang): return spr_mario_boomerang_hold2;
    case (cs_super): return spr_mario_super_hold2;
    case (cs_bomb): return spr_mario_bomb_hold2;
    case (cs_shell): return spr_mario_shell_hold2;
    case (cs_bee): {
    
        if (instance_exists(obj_playerparent))
        && (obj_playerparent.state == 2)
            return spr_mario_bee_hold2_jump;
        else
            return spr_mario_bee_hold2;
    }
    case (cs_lightning): return spr_mario_lightning_hold2;
    case (cs_penguin): return spr_mario_penguin_hold2;
    case (cs_propeller): return spr_mario_propeller_hold2;
    case (cs_cat): return spr_mario_cat_hold2;
    case (cs_football): return spr_mario_football_hold2;
}
