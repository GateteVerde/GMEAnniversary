///scr_player_behaviour_swim()

/*
**  Usage:
**      scr_player_behaviour_swim()
**
**  Purpose:
**      Handles the main movement of the player when it's swimming
*/


//Reset sliding
if (sliding > 0) {

    //Stop sliding
    sliding = 0;
    
    //Clear 'Down' key
    keyboard_clear(global.downkey);
}

//Reset bunny and carrot fly
beefly = 0;
floatnow = 0;
if (isfloating) {

    isfloating = 0;
    if (audio_is_playing(snd_spin))
        audio_stop_sound(snd_spin);
}

//Reset shell timer
shelltime = 0;

//Reset spin jump
stompstyle = 0;

//Reset player local variables
event_user(14);

//Figure out the player's state.
if ((collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0))
|| (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_enemytop,0,0))
|| (collision_rectangle(x-1,bbox_bottom+1,x+1,bbox_bottom+1,obj_slopeparent,1,0)))
&& (ygrav == 0) {

    //If the player is not moving vertically
    if (yspeed >= 0) {

        //Figure out if the player is standing or walking
        if (xspeed == 0)
            state = 0;
        else 
            state = 1;
    
        //Reset state delay
        delay = 0;
    }
    
    //Otherwise, set 'Jump' state
    else if (yspeed < 0)
        state = 2;
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

//Handle the player movement.
if (!disablecontrol) && (!inwall) { //If the player controls are not disabled.

    //If the player does not have either the frog or penguin powerup and it's not holding anything.
    if ((global.powerup == cs_frog)
    || (global.powerup == cs_penguin)) 
    && (holding == 0) {
    
        //Deny gravity at all times
        ygrav = 0
        
        //If the 'Control' key is pressed, move faster.
        if (keyboard_check(global.controlkey))  
            xspeedmax = 2;
        
        //Otherwise, move slower.
        else        
            xspeedmax = 1;
        
        //Handle horizontal movement
        //If the left key is pressed and the player is not crouched down.
        if ((keyboard_check(global.leftkey)) && (!crouch) && (!keyboard_check(global.rightkey))) {
        
            //Set the horizontal speed
            xspeed += -0.2;
            
            //Set the facing direction
            xscale = -1;
            
            //Set the swimming direction
            swimtype = 0;
        }
        
        //Otherwise, if the right key is pressed and the player is not crouched down.
        else if ((keyboard_check(global.rightkey)) && (!crouch) && (!keyboard_check(global.leftkey))) {
        
            //Set the horizontal speed
            xspeed += 0.2;
            
            //Set the facing direction
            xscale = 1;
            
            //Set the swimming direction
            swimtype = 0;
        }
        
        //Otherwise, stop the player.
        else {
        
            //Reduce the player's speed until he stops.
            xspeed = max(0,abs(xspeed)-0.2)*sign(xspeed);
            
            //Set up horizontal speed to 0 when xspeed hits 0.2
            if ((xspeed < 0.2) && (xspeed > -0.2))                
                xspeed = 0;
        }
            
        //If the 'Up' key is pressed.
        if (keyboard_check(global.upkey)) {
        
            //Move upwards
            yspeed += -0.2;
            
            //Set the swimming animation.
            if (xspeed == 0)
                swimtype = 1;
        }
        
        //Otherwise, if the 'Down' key is pressed.
        else if (keyboard_check(global.downkey)) {
        
            //Set the swimming animation
            if (xspeed == 0)
                swimtype = 2;
            
            //Move downwards
            if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0))
            || (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slopeparent,1,0))
                yspeed = 0;
            else
                yspeed += 0.2;
        }
        else {
    
            //Reduce the player's speed until he stops.
            yspeed = max(0,abs(yspeed)-0.2)*sign(yspeed);
            
            //Set up vertical speed to 0 when yspeed hits 0.2
            if ((yspeed < 0.2) && (yspeed > -0.2))                
                yspeed = 0;
        }
            
        //Prevent the player from moving horizontally too fast.
        if (xspeed > xspeedmax) 
            xspeed = xspeedmax;
        if (xspeed < -xspeedmax) 
            xspeed = -xspeedmax;
            
        //Prevent the player from moving vertically too fast.
        if (yspeed > xspeedmax) 
            yspeed = xspeedmax;
        if (yspeed < -xspeedmax) 
            yspeed = -xspeedmax;        
    }
    
    //Otherwise, if the player does not have any of the above powerups.
    else {
    
        //Prevent the player from swimming too fast.
        if (yspeed < -2) 
            yspeed = -2;
            
        //Prevent the player from diving too fast.
        if (yspeed > 4)
            yspeed = 4;
        
        //Set up the maximum horizontal speed.
        if (state == 2) {
        
            //If the player is wearing the blue shell
            if (global.powerup == cs_shell)
                xspeedmax = 2.5;
            else
                xspeedmax = 2;
        }
        else
            xspeedmax = 0.5;
            
        //If the player presses the 'Shift' key.
        if (keyboard_check_pressed(global.shiftkey)) {
        
            //Play 'Swim' sound
            audio_play_sound(snd_swim, 0, false);
        
            //Swim higher if the 'Up' key is pressed.
            if (keyboard_check(global.upkey)) {
            
                //Set the vertical speed
                yspeed -= 2;
                
                //If a kuribo shoe is being ridden, dismount from it.
                if (global.mount == 2)
                    with (obj_kuriboshoe) event_user(0);
                
                //Otherwise, if a Yoshi is being ridden, dismount from it.
                else if (global.mount == 1)
                    with (obj_yoshi) event_user(1);
            }
            
            //Swim lower if the 'Down' key is pressed.
            else if (keyboard_check(global.downkey))
                yspeed -= 0.5;
            
            //Otherwise
            else        
                yspeed -= 1.5;
                
            //Set the state
            state = 2;
        }
        
        //Handle horizontal movement.
        //If the player presses the 'Right' key and the 'Left' key is not held.
        if ((keyboard_check(global.rightkey)) && (!keyboard_check(global.leftkey)) && (!crouch) ) {
            
            //Set the facing direction
            if ((holding == 2) && (xscale != 1)) {
            
                turning = 1;
                alarm[2] = 12;
            }
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
        else if ((keyboard_check(global.leftkey)) && (!keyboard_check(global.rightkey)) && (!crouch)) {
            
            //Set the facing direction
            if ((holding == 2) && (xscale != -1)) {
            
                turning = 1;
                alarm[2] = 12;
            }
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
if (xspeed > xspeedmax)
    xspeed = xspeedmax;
if (xspeed < -xspeedmax)
    xspeed = -xspeedmax;
    
//Apply ygrav
if ((state == 2) || (delay > 0))
    ygrav = grav_swim;      
