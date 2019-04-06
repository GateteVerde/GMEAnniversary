///scr_mario_carry()

/*
**  Usage:
**      scr_mario_carry()
**
**  Purpose:
**      Calls the appropiate carrying sprite for Mario.
*/

switch (global.powerup) {

    case (cs_small): return spr_mario_small_carry;
    case (cs_big): return spr_mario_big_carry;
    case (cs_fire): return spr_mario_fire_carry;
    case (cs_ice): return spr_mario_ice_carry;
    case (cs_carrot): {
    
        if (instance_exists(obj_playerparent))
        && (obj_playerparent.state == 2)
            return spr_mario_carrot_carry_jump;
        else
            return spr_mario_carrot_carry;
    }
    case (cs_leaf): {
    
        if (instance_exists(obj_playerparent))
        && (obj_playerparent.state == 2)
            return spr_mario_raccoon_carry_jump;
        else
            return spr_mario_raccoon_carry;
    }
    case (cs_frog): return spr_mario_frog_carry;
    case (cs_tanooki): {
    
        if (instance_exists(obj_playerparent))
        && (obj_playerparent.state == 2)
            return spr_mario_tanooki_carry_jump;
        else
            return spr_mario_tanooki_carry;
    }
    case (cs_hammer): return spr_mario_hammer_carry;
    case (cs_boomerang): return spr_mario_boomerang_carry;
    case (cs_super): return spr_mario_super_carry;
    case (cs_bomb): return spr_mario_bomb_carry;
    case (cs_shell): return spr_mario_shell_carry;
    case (cs_bee): {
    
        if (instance_exists(obj_playerparent))
        && (obj_playerparent.state == 2)
            return spr_mario_bee_carry_jump;
        else
            return spr_mario_bee_carry;
    }
    case (cs_lightning): return spr_mario_lightning_carry;
    case (cs_penguin): return spr_mario_penguin_carry;
    case (cs_propeller): return spr_mario_propeller_carry;
    case (cs_cat): return spr_mario_cat_carry;
    case (cs_football): return spr_mario_football_carry;
}
