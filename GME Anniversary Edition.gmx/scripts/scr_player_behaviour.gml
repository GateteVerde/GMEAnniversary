///scr_player_behaviour()

/*
**  Usage:
**      scr_player_behaviour()
**
**  Purpose:
**      Handles the main movement of the player.
*/

//Figure out the player's state.
if (collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_semisolid,0,0))
|| (collision_rectangle(x-1,bbox_bottom+1,x+1,bbox_bottom+1,obj_slopeparent,1,0))
&& (gravity == 0) {

    //Figure out if the player is standing or walking
    if (hspeed == 0)
        state = 0;
    else
        state = 1;

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
if (vspeed > 3.5)
    vspeed = 3.5;
    
//Set up the player's maximum horizontal speed.
//Collision with 45ª slopes
if ((collision_rectangle(x-1,bbox_bottom,x+1,bbox_bottom+4,obj_slope_sr,1,0)) && (hspeed > 0))
|| ((collision_rectangle(x-1,bbox_bottom,x+1,bbox_bottom+4,obj_slope_sl,1,0)) && (hspeed < 0)) { 

    //Perform only if walking
    if (state == 1)
        hspeedmax = 0.675;
}
    
//Collision with 22.5ª slopes.
else if ((collision_rectangle(x-1,bbox_bottom,x+1,bbox_bottom+4,obj_slope_r,1,0)) && (hspeed > 0))
|| ((collision_rectangle(x-1,bbox_bottom,x+1,bbox_bottom+4,obj_slope_l,1,0)) && (hspeed < 0)) {

    //Perform only if walking
    if (state == 1)
        hspeedmax = 1.35;
}

//Otherwise, set default limits.
else {
    
    if (keyboard_check(vk_control)) //If the control key is being held.
        hspeedmax = 2.7;
    
    //Otherwise, do not reduce speed until the player makes contact with the ground.  
    else
        hspeedmax = 1.35;
}

//Handle basic movements
if ((!disablecontrol) && (!inwall)) { //If the player's controls are not disabled.

    //Make the player able to jump when is on contact with the ground.
    if (keyboard_check_pressed(vk_shift))
    && (jumping == 0)
    && (vspeed == 0) 
    && (state != 2) { //If the 'Shift' key is pressed and the player is not jumping.
                        
        //Set the vertical speed.
        vspeed = -jumpstr+abs(hspeed)/7.5*-1;
        
        //Make the player able to vary the jump.
        jumping = 1;
        
        //Switch to jump state
        state = 2;
        
        //Move the player a few pixels upwards when on contact with a moving platform or a slope.
        var platform = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0);
        if ((platform) && (platform.vspeed < 0))
            y -= 4;
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
            if (hspeed < hspeedmax) {
                            
                //Make the player move horizontally.
                if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) { //If the player is overlapping a slippery surface.
                    
                    //If the player's horizontal speed is equal/greater than 0.
                    if (hspeed >= 0) {
                    
                        //Add 'acc' to hspeed.
                        hspeed += acc;
                    }
                    else { //Otherwise, if the player's speed is lower than 0.
                    
                        //Add 'accskid' to hspeed;
                        hspeed += accskid;
                    }
                }
                else { //Otherwise, if the player is overlapping a slippery surface.
                
                    //If the player's horizontal speed is equal/greater than 0.
                    if (hspeed >= 0) {
                    
                        //Add 'acc' to hspeed
                        hspeed += acc/2;
                    }
                    else { //Otherwise, if the player's speed is lower than 0.
                    
                        //Add 'accskid' to hspeed.
                        hspeed += accskid/2;
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
            if (hspeed > -hspeedmax) {
                    
                //Make the player move horizontally.
                if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) { //If the player is overlapping a slippery surface.
                    
                    //If the player's horizontal speed is equal/lower than 0.
                    if (hspeed <= 0) {
                        
                        //Add 'acc' to hspeed.
                        hspeed += -acc;
                    }
                    else { //Otherwise, if the player's speed is greater than 0.
                    
                        //Add 'accskid' to hspeed;
                        hspeed += -accskid;
                    }
                }
                else { //Otherwise, if the player is overlapping a slippery surface.
                
                    //If the player's horizontal speed is equal/lower than 0.
                    if (hspeed <= 0) {
                    
                        //Add 'acc' to hspeed
                        hspeed += -acc/2;
                    }
                    else { //Otherwise, if the player's speed is greater than 0.
                    
                        //Add 'accskid' to hspeed.
                        hspeed += -accskid/2;
                    }                                              
                }
            }
        }
    }
    
    //Otherwise if the player is on contact with the ground, slowdown him until he stops.
    else if (vspeed == 0) { 
    
        //If the player is not overlapping a slippery surface.
        if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) {
        
            //If the player is not crouched down.
            if (!crouch) {
            
                //Reduce the player's speed until he stops.
                hspeed = max(0,abs(hspeed)-dec)*sign(hspeed);
                
                //Set up horizontal speed to 0 when hspeed hits the value given on 'dec'.
                if ((hspeed < dec) && (hspeed > -dec))             
                    hspeed = 0;
            }
            else { //If the player is crouched down.
            
                //Reduce the player's speed until he stops.
                hspeed = max(0,abs(hspeed)-dec)*sign(hspeed);
                
                //Set up horizontal speed to 0 when hspeed hits the value given on 'dec'.
                if ((hspeed < decskid) && (hspeed > -decskid))                
                    hspeed = 0;
            }
        }
        else { //Otherwise, if the player is overlapping a slippery surface.
        
            //Reduce the player's speed until he stops.
            hspeed = max(0,abs(hspeed)-dec/8)*sign(hspeed);
            
            //Set up horizontal speed to 0 when hspeed hits the value given on 'dec'.
            if ((hspeed < dec/8) && (hspeed > -dec/8))          
                hspeed = 0;
        }
    }
    
    //Slowdown the player is he is faster than his maximum speed.
    if ((state != 2) && (abs(hspeed) > hspeedmax)) {

        //Slow down Mario's horizontal speed
        hspeed = max(0,abs(hspeed)-0.025)*sign(hspeed);

        //If Mario is slow enough, stop his horizontal speed entirely
        if abs(hspeed) < 0.025
            hspeed = 0
    }
}

//Otherwise, if the player's controls are disabled and the player is on contact with the ground.
else if (vspeed == 0) { 
        
    //If the player is not overlapping a slippery surface.
    if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) {
    
        //If the player is not crouched down.
        if (!crouch) {
        
            //Reduce the player's speed until he stops.
            hspeed = max(0,abs(hspeed)-dec)*sign(hspeed);
            
            //Set up horizontal speed to 0 when hspeed hits the value given on 'dec'.
            if ((hspeed < dec) && (hspeed > -dec))         
                hspeed = 0;
        }
        else { //If the player is crouched down.
        
            //Reduce the player's speed until he stops.
            hspeed = max(0,abs(hspeed)-dec)*sign(hspeed);
            
            //Set up horizontal speed to 0 when hspeed hits the value given on 'dec'.
            if ((hspeed < decskid) && (hspeed > -decskid))        
                hspeed = 0;
        }
    }
    else { //Otherwise, if the player is overlapping a slippery surface.
    
        //Reduce the player's speed until he stops.
        hspeed = max(0,abs(hspeed)-dec/8)*sign(hspeed);
        
        //Set up horizontal speed to 0 when hspeed hits the value given on 'dec'.
        if ((hspeed < dec/8) && (hspeed > -dec/8))   
            hspeed = 0;
    }
}

//If the player is jumping
if ((state == 2) || (delay > 0)) {
    
    //Variable jumping
    if (vspeed < -2) && (jumping == 1)
        gravity = grav_alt;
    
    //Otherwise, use alternate gravity.     
    else {
    
        //Use default gravity
        gravity = grav;
        
        //End variable jumping if it never ends manually.
        if (jumping = 1)
            jumping = 2;
    }
}

//Climb if overlapping a climbing surface.
if (collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_climb,0,0))
&& (!disablecontrol)
&& (keyboard_check(vk_up)) {

    //Change to climbing state
    state = 3;
    
    //Stop movement
    gravity = 0;
    speed = 0;
}

//Handles sliding down slopes and shell/penguin Mario sliding
if keyboard_check_pressed(vk_down)
&& (!disablecontrol)
&& (holding = 0) {

    //If Mario is on a slope, and the above didn't happen, slide normally
    if collision_point(bbox_left,bbox_bottom+1,obj_slopeparent,1,0)
    || collision_point(bbox_right,bbox_bottom+1,obj_slopeparent,1,0)
        sliding = true;
}
