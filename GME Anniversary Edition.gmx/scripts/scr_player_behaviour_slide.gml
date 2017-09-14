///scr_player_behaviour_slide()

/*
**  Usage:
**      scr_player_behaviour_slide()
**
**  Purpose:
**      Handles the main movement of the player when it's sliding down a slope
*/

//Reset following variables
stompstyle = 0;

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
    
//Prevent the player from sliding too fast.
xspeedmax = 2.5;

//You can't slide down slopes while having the frog suit, so make him stop.
if (global.powerup == cs_frog)
    sliding = false;

//Make the player able to jump.
if (!disablecontrol) { //If the player's controls are not disabled.
    
    //Make the player able to jump when is on contact with the ground.
    if (keyboard_check_pressed(vk_shift))
    && (jumping == 0)
    && (yspeed == 0) 
    && (state != 2) { //If the 'Shift' key is pressed and the player is not jumping.
            
        //Set the vertical speed.
        yspeed = -jumpstr+abs(xspeed)/7.5*-1;
                
        //Stop slide
        sliding = false;
        
        //Switch to jump state
        state = 2;        
        
        //Make the player able to vary the jump.
        jumping = 1;
        
        //Play 'Jump' sound
        audio_play_sound(snd_jump, 0, false);
                
        /*Move the player a few pixels upwards when on contact with a moving platform or a slope.
        var platform = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0);
        if ((platform) && (platform.yspeed < 0))
            y -= 4;
        */
    }
}

//Make the player accelerate when sliding down a slope.
if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom,obj_slopeparent,1,0)) {

    //22.5º Right Slope
    if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slope_r,1,0))     
        xspeed += -0.05;
    
    //22.5º Left Slope
    else if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slope_l,1,0))  
        xspeed += 0.05;
    
    //45º Right Slope
    else if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slope_sr,1,0))    
        xspeed += -0.1;
    
    //45º Left Slope
    else if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slope_sl,1,0))    
        xspeed += 0.1;
}

//Make the player decelerate when not sliding down a slope.
else if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slopeparent,1,0)) {

    //If the player is on contact with the floor.
    if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0)) {
    
        //If the player is not on contact with a slippery surface.
        if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) {
        
            //Slowdown
            xspeed = max(0,abs(xspeed)-0.05)*sign(xspeed);
            if ((xspeed > -0.05) && (xspeed < 0.05)) {
            
                //Stop horizontal speed.
                xspeed = 0;
                
                //End combo
                hitcombo = 0;
                
                //Stop sliding behaviour
                sliding = false;
            }
        }
        
        //Otherwise, if the player is on contact with a slippery surface.
        else if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) {
        
            //Slowdown
            xspeed = max(0,abs(xspeed)-0.0125)*sign(xspeed);
            if ((xspeed > -0.0125) && (xspeed < 0.0125)) {
            
                //Stop horizontal speed.
                xspeed = 0;
                
                //End combo
                hitcombo = 0;
                
                //Stop sliding behaviour
                sliding = false;
            }        
        }
    }
}

//Prevent the player from sliding too fast.
if (abs(xspeed) > xspeedmax)
    xspeed = max(0,abs(xspeedmax)-0.1)*sign(xspeed);
    
//If the player is jumping
if ((state == 2) || (delay > 0))
    ygrav = grav;
