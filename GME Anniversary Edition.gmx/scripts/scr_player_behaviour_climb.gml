///scr_player_behaviour_climb()

/*
**  Usage:
**      scr_player_behaviour_climb()
**
**  Purpose:
**      Handles the main movement of the player when it's climbing
*/

//Reset following variables
sliding = 0;
stompstyle = 0;

//Cap horizontal speed
if (hspeed > 1)
hspeed = 1;
if (hspeed < -1)
hspeed = -1;

//Cap vertical speed
if (vspeed > 1)
vspeed = 1;
if (vspeed < -1)
vspeed = -1;

//Handle climbing
if (!disablecontrol) { //If the player controls are not disabled.

    //If the 'Right' key is held and the 'Left' key is not held.
    if (keyboard_check(vk_right)) && (!keyboard_check(vk_left)) {
    
        //Set the horizontal speed.
        hspeed += 0.1;
        
        //Set the facing direction.
        xscale = 1;
    }
    
    //Otherwise, if the 'Left' key is held and the 'Right' key not.
    else if (keyboard_check(vk_left)) && (!keyboard_check(vk_right)) {
    
        //Set the horizontal speed.
        hspeed += -0.1;
        
        //Set the facing direction.
        xscale = -1;
    }
    
    //Otherwise, if neither of the 'Left' or 'Right' keys are being held.
    else {
    
        hspeed = 0;
    }
    
    //If the 'Up' key is held and the 'Down' key is not held.
    if ((keyboard_check(vk_up)) && (!keyboard_check(vk_down))) {
    
        //Check if there's not a solid in the way.
        if (!collision_rectangle(bbox_left,bbox_top-1,bbox_right,bbox_top-1,obj_solid,0,0))
        && (!collision_rectangle(bbox_left,bbox_top-1,bbox_right,bbox_top-1,obj_ceilslopeparent,1,0)) {
        
            //If there's not a climbable surface above the player.
            if (!collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_climb,0,0)) 
                vspeed = 0;
            
            else { //Otherwise, allow him to climb.
            
                //Set the vertical speed.
                vspeed += -0.1;
                
                //Play a sound when climbing a vine
                if (!collision_point(x,y,obj_climb_net,1,0)) {
                
                    if (speed > 0) {
                    
                        climb++;
                        if (climb > 7) {
                        
                            //Reset variable
                            climb = 0;
                            
                            //Play 'Climb' sound
                            audio_play_sound(snd_climb, 0, false);
                        }
                    }
                    else {
                    
                        //Keep climb variable at 0
                        climb = 0;
                    }
                }
                else {
                
                    //Keep climb variable at 0
                    climb = 0;
                }
            }
        }
    }
    
    //If the 'Down' key is held and the 'Up' key not.
    else if ((keyboard_check(vk_down)) && (!keyboard_check(vk_up))) {
    
        //Set the vertical speed.
        vspeed += 0.1;
        
        //Check for a nearby floor and stop climbing if there's one.
        var semisolid = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom,obj_semisolid,0,0);
        if (semisolid)
            state = 2;
    }
    
    //Otherwise, if neither of the 'Up' or 'Down' keys are being held.
    else            
        vspeed = 0;
    
    //Make the player able to jump.
    if (keyboard_check_pressed(vk_shift)) { //If the 'Shift' key is pressed and the player is not jumping.
        
        //Set the vertical speed.
        vspeed = -jumpstr;
        
        //Set the jumping state.
        state = 2;      
          
        //Make the player able to vary the jump.
        jumping = 1;
        
        //Play 'Jump' sound
        audio_play_sound(snd_jump, 0, false);       
    }
}

//Check if there's a not climbable surface overlapping the player.
if (!collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_climb,0,0))        
    state = 2;
