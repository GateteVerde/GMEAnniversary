///scr_global_jump()

/*
**  Usage:
**      scr_global_jump()
**
**  Purpose:
**      Calls the appropiate warp sprite for the player
**
**  Notes:
**      Use only on obj_player_jump and obj_player_warpnote
*/

switch (global.player) {

    //Mario
    case (0): {
    
        //If the player is holding something
        if (holding) {
        
            sprite_index = scr_mario_hold();
            image_speed = 0;
            image_index = 1;
        }
            
        //Otherwise, if it's not holding anything
        else {
        
            sprite_index = scr_mario_jump();
            image_speed = 0;
            image_index = 0;
        }
    } break;
}
