///scr_player_behaviour_swim()

/*
**  Usage:
**      scr_player_behaviour_swim()
**
**  Purpose:
**      Handles the main movement of the player when it's swimming
*/

//Reset following variables
sliding = 0;
stompstyle = 0;

//Figure out the player's state.
if (collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_semisolid,0,0))
|| (collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+2,obj_slopeparent,1,0))
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

//Make the player uncrouch if jumping.
if ((state == 2) && (crouch))
    crouch = false;

//Prevent the player from swimming too fast.
if (vspeed < -2) 
    vspeed = -2;
    
//Prevent the player from diving too fast.
if (vspeed > 4)
    vspeed = 4;

//Set up the maximum horizontal speed.
if (state == 2)
    hspeedmax = 2;
else
    hspeedmax = 0.5;

//Handle the player movement.
if (!disablecontrol) && (!inwall) { //If the player controls are not disabled.

    //If the player presses the 'Shift' key.
    if (keyboard_check_pressed(vk_shift)) {
    
        //Play 'Swim' sound
        audio_play_sound(snd_swim, 0, false);
    
        //Swim higher if the 'Up' key is pressed.
        if (keyboard_check(vk_up))
            vspeed -= 2;
        
        //Swim lower if the 'Down' key is pressed.
        else if (keyboard_check(vk_down))
            vspeed -= 0.5;
        
        //Otherwise
        else        
            vspeed -= 1.5;
            
        //Set the state
        state = 2;
            
        //Move the player a few pixels upwards when on contact with a moving platform or a slope.
        var platform = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0);
        if (platform)
        && (platform.vspeed < 0)
            y -= 4;
    }
    
    //Handle horizontal movement.
    //If the player presses the 'Right' key and the 'Left' key is not held.
    if ((keyboard_check(vk_right)) && (!keyboard_check(vk_left)) && (!crouch) ) {
        
        //Set the facing direction.
        xscale = 1;
        
        //If there's NOT a wall on the way.
        if (!collision_rectangle(bbox_right,bbox_top+4,bbox_right+1,bbox_bottom-1,obj_solid,1,0)) {
        
            //Set the horizontal speed.
            if (hspeed >= 0) //If the player horizontal speed is equal/greater than 0.        
                hspeed += acc_swim;
            
            //Otherwise, If the player horizontal speed is lower than 0.
            else         
                hspeed += acc_swim*2;
        }
    }
    
    //If the player presses the 'Left' key and the 'Right' key is not held.
    else if ((keyboard_check(vk_left)) && (!keyboard_check(vk_right)) && (!crouch)) {
        
        //Set the facing direction
        xscale = -1;
        
        //If there's NOT a wall on the way.
        if (!collision_rectangle(bbox_left-1,bbox_top+4,bbox_left,bbox_bottom-1,obj_solid,1,0)) {
        
            //Set the horizontal speed.
            if (hspeed <= 0) //If the player horizontal speed is equal/lower than 0.        
                hspeed += -acc_swim;
                
            //Otherwise, If the player horizontal speed is greater than 0. 
            else        
                hspeed += -acc_swim*2;
        }      
    }
    
    //Otherwise, if neither of the 'Left' key or 'Right' key is not held.
    else if (vspeed == 0) { //If the player is on the ground.
    
        //Reduce the player speed until he stops.
        hspeed = max(0,abs(hspeed)-dec_swim)*sign(hspeed);
        
        //Set up horizontal speed to 0 when hspeed hits the value given on 'dec_swim'.
        if ((hspeed < dec_swim) && (hspeed > -dec_swim))      
            hspeed = 0;     
    }
}

//Otherwise, If the player controls are disabled.
else if (disablecontrol) {

    //Reduce the player speed until he stops.
    hspeed = max(0,abs(hspeed)-dec_swim)*sign(hspeed);
    
    //Set up horizontal speed to 0 when hspeed hits the value given on 'dec_swim'.
    if ((hspeed < dec_swim) && (hspeed > -dec_swim))    
        hspeed = 0;        
}

//Prevent the player from sliding too fast.
if (state != 2)
&& (abs(hspeed) > hspeedmax)
    hspeed = max(0,abs(hspeedmax)-0.1)*sign(hspeed);
    
//Apply gravity
if ((state == 2) || (delay > 0))
    gravity = grav_swim;      
