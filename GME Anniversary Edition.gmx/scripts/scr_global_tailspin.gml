///scr_global_tailspin()

/*
**  Usage:
**      scr_global_tailspin()
**
**  Purpose:
**      Calls the appropiate attack sprite for the correct character
**
**  Notes:
**      Use only on obj_spinner
*/

//Mario
if (global.player == 0) {

    //Check what powerup does Mario have
    switch (global.powerup) {
    
        //Cat
        case (cs_cat): return spr_mario_cat_attack2;
        
        //Leaf
        case (cs_leaf): return spr_mario_raccoon_attack;
        
        //Tanooki
        case (cs_tanooki): return spr_mario_tanooki_attack;
    }
}
