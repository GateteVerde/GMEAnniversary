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
    if (xspeed == 0)
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
if (yspeed > 4)
    yspeed = 4;
    
//Prevent the player from sliding too fast.
xspeedmax = 2.5;

//You can't slide down slopes while having the frog suit, so make him stop.
if (global.powerup == cs_frog)
    sliding = false;

//Make the player able to jump.
if (!disablecontrol) { //If the player's controls are not disabled.

    //Water surfing as a penguin
    if (global.powerup == cs_penguin) {
    
        //If the player is moving down.
        if (yspeed >= 0) { 
        
            //Check for a semisolid object
            var waterway = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+yspeed,obj_swim,0,0);
            
            //If the semisolid exists and the player is above it.
            if (waterway)
            && (bbox_bottom < waterway.yprevious+4)
            && (!collision_rectangle(bbox_left,bbox_top+4,bbox_right,waterway.y-1,obj_solid,0,0)) {
            
                //Snap above the semisolid platform
                y = waterway.y-15;
                
                //Stop vertical movement
                yspeed = 0;
                ygrav = 0;
                
                //Force set walking state
                state = 1;                
                
                //Reset values
                event_user(15);
            }
        }
    }
    
    //Make the player able to jump when is on contact with the ground.
    if (keyboard_check_pressed(vk_shift))
    && (jumping == 0)
    && (yspeed == 0) 
    && (state != 2) { //If the 'Shift' key is pressed and the player is not jumping.
        
        //Stop slide
        if (global.powerup != cs_shell)
        && (global.powerup != cs_penguin)             
            sliding = false;
                    
        //Set the vertical speed.
        yspeed = -jumpstr+abs(xspeed)/7.5*-1;
                
        //Make the player able to vary the jump.
        jumping = 1;             
        
        //Switch to jump state
        state = 2;        
                
        //Play 'Jump' sound
        audio_play_sound(snd_jump, 0, false);
                
        /*Move the player a few pixels upwards when on contact with a moving platform or a slope.
        var platform = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0);
        if ((platform) && (platform.yspeed < 0))
            y -= 4;
        */
    }
    
    //Check if the player should still be variable jumping
    if (keyboard_check_released(vk_shift))
    && (jumping == 1)
        jumping = 2;
}


//Accelerate when in contact with a slope
if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom,obj_slopeparent,1,0)) {

    //If the player does have the shell or penguin powerup and it's not at full speed.
    if (((global.powerup == cs_shell) || (global.powerup == cs_penguin)) && (abs(xspeed) != xspeedmax)) 
    || ((global.powerup != cs_shell) && (global.powerup != cs_penguin)) {
    
        //22.5º Right Slope
        if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slope_r,1,0))
            xspeed += -0.075;
        
        //22.5º Left Slope
        else if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slope_l,1,0))  
            xspeed += 0.075;
        
        //45º Right Slope
        else if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slope_sr,1,0))    
            xspeed += -0.15;
        
        //45º Left Slope
        else if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slope_sl,1,0))    
            xspeed += 0.15;
    }
}

//Make the player decelerate when not sliding down a slope.
else if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slopeparent,1,0)) {

    //If the player is on contact with the floor.
    if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0)) {
    
        //If the player does have the shell or penguin powerups and the horizontal speed is not equal to the maximum speed.
        if (((global.powerup == cs_shell) 
        || (global.powerup == cs_penguin)) 
        && (abs(xspeed) != xspeedmax)) 
        
        //Or the player does not have either the shell or penguin powerup.
        || ((global.powerup != cs_shell)
        && (global.powerup != cs_penguin)) {
    
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
}

//End sliding when the 'Down' key is no longer pressed and the player is on ground.
if (!keyboard_check(vk_down)) 
&& (state < 2)
&& ((global.powerup == cs_shell)
|| (global.powerup == cs_penguin))
    sliding = false;

//Prevent the player from sliding too fast.
if (xspeed > xspeedmax)
    xspeed = xspeedmax;
if (xspeed < -xspeedmax)
    xspeed = -xspeedmax;
    
//If the player is jumping
if ((state == 2) || (delay > 0)) {
    
    //Variable jumping
    if (yspeed < -2) && (jumping == 1)
        ygrav = grav_alt;
    
    //Otherwise, use default gravity.     
    else {
    
        //Use default gravity
        ygrav = grav+0.1;
        
        //End variable jumping if it never ends manually.
        if (jumping = 1)
            jumping = 2;
    }
}

//Set facing direction if the player has either the shell or penguin powerup
if ((global.powerup == cs_shell)
|| (global.powerup == cs_penguin)) {

    if (xspeed > 0)
        xscale = 1;
    if (xspeed < 0)
        xscale = -1;
}
