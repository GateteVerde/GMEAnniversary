///scr_player_behaviour_swim()

/*
**  Usage:
**      scr_player_behaviour_swim()
**
**  Purpose:
**      Handles the main movement of the player when it's swimming
*/

//Reset following variables
floatnow = 0;
beefly = 0;
sliding = 0;
stompstyle = 0;
if (isfloating) {

    isfloating = 0;
    if (audio_is_playing(snd_spin))
        audio_stop_sound(snd_spin);
}

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

//Make the player uncrouch if jumping.
if ((state == 2) && (crouch))
    crouch = false;

//Prevent the player from swimming too fast.
if (yspeed < -2) 
    yspeed = -2;
    
//Prevent the player from diving too fast.
if (yspeed > 4)
    yspeed = 4;

//Set up the maximum horizontal speed.
if (state == 2)
    xspeedmax = 2;
else
    xspeedmax = 0.5;

//Handle the player movement.
if (!disablecontrol) && (!inwall) { //If the player controls are not disabled.

    //If the player presses the 'Shift' key.
    if (keyboard_check_pressed(vk_shift)) {
    
        //Play 'Swim' sound
        audio_play_sound(snd_swim, 0, false);
    
        //Swim higher if the 'Up' key is pressed.
        if (keyboard_check(vk_up))
            yspeed -= 2;
        
        //Swim lower if the 'Down' key is pressed.
        else if (keyboard_check(vk_down))
            yspeed -= 0.5;
        
        //Otherwise
        else        
            yspeed -= 1.5;
            
        //Set the state
        state = 2;
            
        /*Move the player a few pixels upwards when on contact with a moving platform or a slope.
        var platform = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0);
        if (platform)
        && (platform.yspeed < 0)
            y -= 4;
        */
    }
    
    //Handle horizontal movement.
    //If the player presses the 'Right' key and the 'Left' key is not held.
    if ((keyboard_check(vk_right)) && (!keyboard_check(vk_left)) && (!crouch) ) {
        
        //Set the facing direction.
        xscale = 1;
        
        //If there's NOT a wall on the way.
        if (!collision_rectangle(bbox_right,bbox_top+4,bbox_right+1,bbox_bottom-1,obj_solid,1,0)) {
        
            //Set the horizontal speed.
            if (xspeed >= 0) //If the player horizontal speed is equal/greater than 0.        
                xspeed += acc_swim;
            
            //Otherwise, If the player horizontal speed is lower than 0.
            else         
                xspeed += acc_swim*2;
        }
    }
    
    //If the player presses the 'Left' key and the 'Right' key is not held.
    else if ((keyboard_check(vk_left)) && (!keyboard_check(vk_right)) && (!crouch)) {
        
        //Set the facing direction
        xscale = -1;
        
        //If there's NOT a wall on the way.
        if (!collision_rectangle(bbox_left-1,bbox_top+4,bbox_left,bbox_bottom-1,obj_solid,1,0)) {
        
            //Set the horizontal speed.
            if (xspeed <= 0) //If the player horizontal speed is equal/lower than 0.        
                xspeed += -acc_swim;
                
            //Otherwise, If the player horizontal speed is greater than 0. 
            else        
                xspeed += -acc_swim*2;
        }      
    }
    
    //Otherwise, if neither of the 'Left' key or 'Right' key is not held.
    else if (yspeed == 0) { //If the player is on the ground.
    
        //Reduce the player speed until he stops.
        xspeed = max(0,abs(xspeed)-dec_swim)*sign(xspeed);
        
        //Set up horizontal speed to 0 when xspeed hits the value given on 'dec_swim'.
        if ((xspeed < dec_swim) && (xspeed > -dec_swim))      
            xspeed = 0;     
    }
}

//Otherwise, If the player controls are disabled.
else if (disablecontrol) {

    //Reduce the player speed until he stops.
    xspeed = max(0,abs(xspeed)-dec_swim)*sign(xspeed);
    
    //Set up horizontal speed to 0 when xspeed hits the value given on 'dec_swim'.
    if ((xspeed < dec_swim) && (xspeed > -dec_swim))    
        xspeed = 0;        
}

//Prevent the player from sliding too fast.
if (abs(xspeed) > xspeedmax)
    xspeed = max(0,abs(xspeedmax)-0.1)*sign(xspeed);
    
//Apply ygrav
if ((state == 2) || (delay > 0))
    ygrav = grav_swim;      
