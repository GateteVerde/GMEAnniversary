///scr_player_behaviour()

/*
**  Usage:
**      scr_player_behaviour()
**
**  Purpose:
**      Handles the main movement of the player.
*/

//Figure out the player's state.
if ((collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_semisolid,0,0))
|| (collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_slopeparent,1,0)))
&& (ygrav == 0) {

    //Figure out if the player is standing or walking
    if (xspeed != 0)
        state = 1;
    else 
        state = 0;

    //Reset state delay
    delay = 0;
}

//the player is jumping if there's no ground below him.
else {

    //Delay the change to the jump state
    if (delay > 4)
        state = 2;
    else
        delay++;
}

//Prevent the player from falling too fast.
if (yspeed > 4)
    yspeed = 4;
    
//Set up the player's maximum horizontal speed.
if (!flying) { //If the player is not flying

    if (keyboard_check(vk_control)) { //If the control key is being held.
        
        //If the P-Meter is filled up.
        if (run)  
            xspeedmax = 3;
        
        //Otherwise, if the P-Meter is not filled up.
        else    
            xspeedmax = 2.5;
    }               
    
    //Otherwise, do not reduce speed until Mario makes contact with the ground.  
    else  
        xspeedmax = 1.5;
}

//Otherwise, if Mario is flying.
else 
    xspeedmax = 2;

//Handle basic movements
if ((!disablecontrol) && (!inwall)) { //If the player's controls are not disabled.

    //Make the player able to jump when is on contact with the ground.
    if (keyboard_check_pressed(vk_shift))
    && (jumping == 0)
    && (yspeed == 0) 
    && (state != 2) { //If the 'Shift' key is pressed and the player is not jumping.
                            
        //If the 'Up' key is pressed.
        if (keyboard_check(vk_up)) {
            
            //Set the vertical speed.
            yspeed = -jumpstr;
            
            //Set the stomp style
            stompstyle = true;
            
            //Play 'Jump' sound
            audio_play_sound(snd_spin, 0, false);                    
        }
        
        //Otherwise, if it's not
        else if (!keyboard_check(vk_up)) {
            
            //Set the vertical speed.
            yspeed = -jumpstr+abs(xspeed)/7.5*-1;
            
            //Set the stomp style
            stompstyle = false;
            
            //Play 'Jump' sound
            audio_play_sound(snd_jump, 0, false);
        }
        
        //Switch to jump state
        state = 2;        
        
        //Make the player able to vary the jump.
        jumping = 1;
                
        /*Move the player a few pixels upwards when on contact with a moving platform or a slope.
        var platform = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0);
        if ((platform) && (platform.yspeed < 0))
            y -= 4;
        */
    }
    
    //Make the player fall if the player releases the 'Shift' key.
    else if ((jumping == 1) && (keyboard_check_released(vk_shift)))         
        jumping = 2;
    
    //Enable/Disable controls
    if (crouch) { //If the player is crouched down.
    
        if (state == 2) { //If the player is jumping.
        
            //Allow the player's horizontal movement.
            move = true;
        }
        else { //Otherwise, disallow the player's movement.
        
            //Disallow the player's horizontal movement.
            move = false;    
        }
    }
    else { //If the player is not crouched down.
    
        move = true;
    }
    
    //Handle Horizontal Movement.
    if ((keyboard_check(vk_right)) && (!keyboard_check(vk_left)) && (move)) { //If the player holds the 'Right' key and the 'Left' key is not being held.
        
        //Set the facing direction.
        xscale = 1;
        
        //If there's NOT a wall on the way.
        if (!collision_rectangle(bbox_right,bbox_top+4,bbox_right+1,bbox_bottom-1,obj_solid,1,0)) {
        
            //Check up the player's horizontal speed
            if (xspeed < xspeedmax) {
                            
                //Make the player move horizontally.
                if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) { //If the player is overlapping a slippery surface.
                    
                    //If the player's horizontal speed is equal/greater than 0.
                    if (xspeed >= 0) {
                    
                        //Add 'acc' to xspeed.
                        xspeed += acc;
                    }
                    else { //Otherwise, if the player's speed is lower than 0.
                    
                        //Add 'accskid' to xspeed;
                        xspeed += accskid;
                    }
                }
                else { //Otherwise, if the player is overlapping a slippery surface.
                
                    //If the player's horizontal speed is equal/greater than 0.
                    if (xspeed >= 0) {
                    
                        //Add 'acc' to xspeed
                        xspeed += acc/2;
                    }
                    else { //Otherwise, if the player's speed is lower than 0.
                    
                        //Add 'accskid' to xspeed.
                        xspeed += accskid/2;
                    }                                              
                }
            }
        }
    }
    
    //Otherwise, if the player holds the 'Left' key and the 'Right' key is not being held.
    else if ((keyboard_check(vk_left)) && (!keyboard_check(vk_right)) && (move)) {
        
        //Set the facing direction.
        xscale = -1;
        
        //If there's NOT a wall on the way.
        if (!collision_rectangle(bbox_left-1,bbox_top+4,bbox_left,bbox_bottom-1,obj_solid,1,0)) {
        
            //Check up the player's horizontal speed.
            if (xspeed > -xspeedmax) {
                    
                //Make the player move horizontally.
                if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) { //If the player is overlapping a slippery surface.
                    
                    //If the player's horizontal speed is equal/lower than 0.
                    if (xspeed <= 0) {
                        
                        //Add 'acc' to xspeed.
                        xspeed += -acc;
                    }
                    else { //Otherwise, if the player's speed is greater than 0.
                    
                        //Add 'accskid' to xspeed;
                        xspeed += -accskid;
                    }
                }
                else { //Otherwise, if the player is overlapping a slippery surface.
                
                    //If the player's horizontal speed is equal/lower than 0.
                    if (xspeed <= 0) {
                    
                        //Add 'acc' to xspeed
                        xspeed += -acc/2;
                    }
                    else { //Otherwise, if the player's speed is greater than 0.
                    
                        //Add 'accskid' to xspeed.
                        xspeed += -accskid/2;
                    }                                              
                }
            }
        }
    }
    
    //Otherwise if the player is on contact with the ground, slowdown him until he stops.
    else if (yspeed == 0) { 
    
        //If the player is not overlapping a slippery surface.
        if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) {
        
            //If the player is not crouched down.
            if (!crouch) {
            
                //Reduce the player's speed until he stops.
                xspeed = max(0,abs(xspeed)-dec)*sign(xspeed);
                
                //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
                if ((xspeed < dec) && (xspeed > -dec))             
                    xspeed = 0;
            }
            else { //If the player is crouched down.
            
                //Reduce the player's speed until he stops.
                xspeed = max(0,abs(xspeed)-dec)*sign(xspeed);
                
                //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
                if ((xspeed < decskid) && (xspeed > -decskid))                
                    xspeed = 0;
            }
        }
        else { //Otherwise, if the player is overlapping a slippery surface.
        
            //Reduce the player's speed until he stops.
            xspeed = max(0,abs(xspeed)-dec/8)*sign(xspeed);
            
            //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
            if ((xspeed < dec/8) && (xspeed > -dec/8))          
                xspeed = 0;
        }
    }
}

//Otherwise, if the player's controls are disabled and the player is on contact with the ground.
else if (yspeed == 0) { 
        
    //If the player is not overlapping a slippery surface.
    if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) {
    
        //If the player is not crouched down.
        if (!crouch) {
        
            //Reduce the player's speed until he stops.
            xspeed = max(0,abs(xspeed)-dec)*sign(xspeed);
            
            //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
            if ((xspeed < dec) && (xspeed > -dec))         
                xspeed = 0;
        }
        else { //If the player is crouched down.
        
            //Reduce the player's speed until he stops.
            xspeed = max(0,abs(xspeed)-dec)*sign(xspeed);
            
            //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
            if ((xspeed < decskid) && (xspeed > -decskid))        
                xspeed = 0;
        }
    }
    else { //Otherwise, if the player is overlapping a slippery surface.
    
        //Reduce the player's speed until he stops.
        xspeed = max(0,abs(xspeed)-dec/8)*sign(xspeed);
        
        //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
        if ((xspeed < dec/8) && (xspeed > -dec/8))   
            xspeed = 0;
    }
}

//Slowdown the player is he is faster than his maximum speed.
if ((state != 2) && (abs(xspeed) > xspeedmax))
    xspeed = max(0,abs(xspeed)-0.1)*sign(xspeed);

//If Mario is jumping
if ((state == 2) || (delay > 0)) {
    
    //Variable jumping
    if (yspeed < -2) && (jumping == 1) {
    
        //Use alternate ygrav
        ygrav = grav_alt;
    }   
    
    //Otherwise, use alternate ygrav.     
    else {
    
        //Use default ygrav
        ygrav = grav;
        
        //End variable jumping if it never ends manually.
        if (jumping = 1)
            jumping = 2;
    }

    //If Mario is using the raccoon or the tanooki powerup.
    if ((global.powerup == cs_leaf) || (global.powerup == cs_tanooki)) {
    
        //If ygrav is disabled.
        if (disablegrav > 0) {
        
            if (state != 2) {
            
                //Enable ygrav
                disablegrav = 0;
            }
            else {
            
                //Deny ygrav
                ygrav = 0;
                
                //Enable ygrav
                disablegrav--;
            }
        }
    }
    
    //Otherwise, enable ygrav.
    else
        disablegrav = 0;
}

//Climb if overlapping a climbing surface.
if (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_climb,0,0))
&& (holding = 0)
&& (!disablecontrol)
&& (keyboard_check(vk_up)) {

    //Change to climbing state
    state = 3;
    
    //Stop movement
    yspeed = 0;
    ygrav = 0;    
}

//Makes Mario butt-slide down slopes
if (keyboard_check_pressed(vk_down)) 
&& (disablecontrol == 0) {

    //If Mario is on a slope, and the above didn't happen, slide normally
    if (collision_point(bbox_left-1,bbox_bottom+2,obj_slopeparent,1,0)) 
    || (collision_point(bbox_right+1,bbox_bottom+2,obj_slopeparent,1,0)) {
    
        //If Mario can slide and it's not holding anything.
        if (holding == 0)
            sliding = true;
            
        //Otherwise, just crouch down if Mario can do it.
        else
            crouch = true;
    }       
}

//Make Mario able to fly or slowdown his fall.
if ((global.powerup == cs_leaf) || (global.powerup == cs_tanooki))
&& (jumping != 1)
&& (state == 2)
&& (swimming == false)
&& (stompstyle == false)
&& (keyboard_check_pressed(vk_shift)) {

    //If Mario is running.
    if (run) {
    
        //Play 'tail' sound.
        audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);
        
        //Make Mario able to fly for 4 seconds
        if (!flying) {
        
            flying = true;
            alarm[9] = 240;
        }
        
        //Whip tail.
        wiggle = 16;
        
        //Disable grav.
        disablegrav = 16;            
        
        //Set the vertical speed.
        if (alarm[9] > 30)  
            yspeed = -1.5;
        else {
        
            if (yspeed < 0)
                yspeed  = max(yspeed + 0.5, 0);
            else
                yspeed = 0;
        }
    }
    
    //Otherwise, if Mario is not running.
    else if (!run) { 
    
        //Play 'tail' sound.
        audio_stop_sound(snd_spin);
        audio_play_sound(snd_spin, 0, false);      
        
        //Whip tail.
        wiggle = 16;
        
        //Disable grav.
        disablegrav = 16;
        
        //Set the vertical speed.
        yspeed = 0.75;
    }
}
