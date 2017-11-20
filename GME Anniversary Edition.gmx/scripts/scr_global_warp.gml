///scr_global_warp()

/*
**  Usage:
**      scr_global_warp()
**
**  Purpose:
**      Calls the appropiate warp sprite for the player
**
**  Notes:
**      Use only on obj_player_warp
*/

//Check what player is being used
switch (global.player) {

    //Mario
    case (0): {
    
        //If the player is not in cannon mode
        if (cannon < 2) {
    
            //If the player is moving vertically
            if (vspeed != 0) {
            
                sprite_index = scr_mario_spin();
                image_speed = 0;
                image_index = 0;
            }
                
            //Otherwise, if the player is moving horizontally
            else {
            
                //Set the animation
                image_speed = 0.2;
            
                //If the player is holding something
                if (holding)
                    sprite_index = scr_mario_hold();
                    
                //Otherwise
                else
                    sprite_index = scr_mario_walk();
            }
        }
        
        //Otherwise, if the player is on diagonal cannon mode
        else {
        
            //Do not animate
            image_speed = 0;
            image_index = 0;
            
            //If the player is holding something
            if (holding)
                sprite_index = scr_mario_hold();
            else
                sprite_index = scr_mario_runjump();
        }
    }
}
