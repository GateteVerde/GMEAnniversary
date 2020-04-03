///scr_player_behaviour()

/*
**  Usage:
**      scr_player_behaviour()
**
**  Purpose:
**      Handles the main movement of the player.
*/

//Figure out the player's state.
if ((collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_semisolid,0,0))
|| (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_enemytop,0,0))
|| (collision_rectangle(x-1,bbox_bottom+1,x+1,bbox_bottom+1,obj_slopeparent,1,0)))
&& (ygrav == 0) {

    //If the player is flying...
    if ((flying) && (yspeed < 0)) 
    
    //...or the player is floating...
    || ((isfloating) && (yspeed < 0))
    
    //...or the player is riding yoshi and fluttering
    || ((instance_exists(obj_yoshi)) && (obj_yoshi.flutter == 1) && (yspeed < 0)) {
    
        //If the player is overlapping a slope, set up jumping state.
        if (collision_rectangle(x-1,bbox_top,x+1,bbox_bottom,obj_slopeparent,1,1))      
            state = 2;
    }
    
    //Otherwise, do the normal check
    else {
    
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

    if (keyboard_check(global.controlkey)) { //If the control key is being held.
        
        //If Mario does have the frog powerup
        if (global.powerup == cs_frog) {
        
            if (holding == 0)
                xspeedmax = walkspeed;
            else {
                            
                //If the P-Meter is filled up.
                if (run)
                    xspeedmax = fullrunspeed+abs(0.3*instance_number(obj_invincibility));
                
                //Otherwise, if the P-Meter is not filled up.
                else    
                    xspeedmax = runspeed+abs(0.3*instance_number(obj_invincibility));                
            }
        }
        
        //Otherwise, if Mario does not have the frog powerup
        else {
            
            //If the P-Meter is filled up.
            if (run) 
                xspeedmax = fullrunspeed+abs(0.3*instance_number(obj_invincibility));
            
            //Otherwise, if the P-Meter is not filled up.
            else    
                xspeedmax = runspeed+abs(0.3*instance_number(obj_invincibility));
        }
    }               
    
    //Otherwise, do not reduce speed until the player makes contact with the ground.  
    else     
        xspeedmax = walkspeed;
}

//Otherwise, if the player is flying.
else {

    //If the player is flying
    if (flyfix == 1) {
    
        xspeedmax = 2;
        if (xspeed > 2)
            xspeed -= acc;
        if (xspeed < -2)
            xspeed += acc;
    }
    else {
    
        //Set running speed
        if (keyboard_check(global.controlkey))
            xspeedmax = runspeed+abs(0.3*instance_number(obj_invincibility));           
        
        //Otherwise, do not reduce speed until the player makes contact with the ground.  
        else     
            xspeedmax = walkspeed;    
    }
}
    
//If controls are not disabled or the player is not stuck in a wall
if (!disablecontrol) 
&& (inwall == 0) {

    //Handles the player's jumping
    if (keyboard_check_pressed(global.shiftkey))
    
    //Make sure that the player can jump
    && (((jumping == 0) && (state < 2))
    
    //Allow the player to jump off of Yoshi or a shoe while in midair
    || ((keyboard_check(global.upkey))
    && (!crouch)
    && (holding == 4)
    && (global.mount != 0))
    
    //Allow propeller the player to do his special jump
    || ((global.powerup == cs_propeller)
    && (keyboard_check(global.upkey)) 
    && (!stompstyle) 
    && (!crouch) 
    && (holding == 0))
    
    //Allow the player to jump in mid-air while riding a kuribo shoe
    || ((global.mount == 2) 
    && (state == 2) 
    && (yspeed > 0)
    && (jumping == 0))
    
    //Do not allow jump if the player is bouncing on a note block. 
    && (!collision_rectangle(bbox_left,bbox_bottom+1,bbox_right,bbox_bottom+1,obj_noteblock,0,1))) {
    
        //Make the player spin jump
        if ((keyboard_check(global.upkey))
        && (!crouch)
        && ((holding == 0) || (holding == 4))) {
        
            //If a kuribo shoe is being ridden, dismount from it.
            if (global.mount == 2) {
            
                with (obj_kuriboshoe) event_user(0);
                if (state < 2) {
                    
                    //Play 'Spin' sound
                    audio_play_sound(snd_spin, 0, false);
                    
                    //Set horizontal speed
                    xspeed = 1*(xscale*-1);
                
                    //Set spin jump variable
                    stompstyle = true;        
                }
                else {
                
                    //Do not set spin jump
                    stompstyle = false;
                
                    //Play 'Jump' sound
                    audio_play_sound(snd_jump, 0, false);
                }            
            }
            
            //If a Yoshi is being ridden, dismount from it.
            else if (global.mount == 1) {
            
                with (obj_yoshi) event_user(1);
                if (state < 2) {
                    
                    //Play 'Spin' sound
                    audio_play_sound(snd_spin, 0, false);
                    
                    //Set horizontal speed
                    xspeed = 1*(xscale*-1);
                
                    //Set spin jump variable
                    stompstyle = true;        
                }
                else {
                
                    //Do not set spin jump
                    stompstyle = false;
                
                    //Play 'Jump' sound
                    audio_play_sound(snd_jump, 0, false);
                }              
            }
            
            else {
            
                //Set spin jump variable
                stompstyle = true;

                //Play spin jump sound
                audio_play_sound(snd_spin, 0, false);
            }
        }
    
        //Play the jump sound if he is not spin jumping
        else {
                
            //Do not set spin jump
            stompstyle = false;
        
            //Play 'Jump' sound
            audio_play_sound(snd_jump, 0, false);
            
            //If the player is doing a somersault
            if (instance_exists(obj_invincibility))
                somersault = 1;
        }
    
        //Switch to the jump state
        state = 2;     
        
        //Enable variable jumping
        jumping = 1;
        
        //Jump high if you have the frog powerup, and you are not riding anything
        if (global.powerup == cs_frog)        
            yspeed = -frogjumpstr;
    
        //Jump depending of the horizontal speed.
        else     
            yspeed = -jumpstr+abs(xspeed)/7.5*-1;   
    }
    
    //Check if the player should still be variable jumping
    if (keyboard_check_released(global.shiftkey))
    && (jumping == 1)
        jumping = 2;
    
    //Enable/Disable controls
    event_user(2);
    
    //Handle Horizontal Movement.
    if ((keyboard_check(global.rightkey)) && (move) && (wallkick < 1) && (!keyboard_check(global.leftkey))) { //If the player holds the 'Right' key and the 'Left' key is not being held.
        
        //Set the facing direction        
        if ((holding == 2) && (xscale != 1)) {
        
            turning = 1;
            alarm[2] = 6;
        }
        
        //If the player is not overlapping a wall
        if (!collision_rectangle(bbox_left,bbox_top+4,bbox_right,bbox_top+4,obj_solid,0,0))
            xscale = 1;
        
        //Check up the player's horizontal speed
        if (xspeed < xspeedmax) {
                        
            //Make the player move horizontally.
            if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) 
            || (global.powerup == cs_penguin) { //If the player is not overlapping a slippery surface.
                
                //If the player's horizontal speed is equal/greater than 0.
                if (xspeed >= 0) {
                
                    //Add 'acc' to xspeed.
                    if (global.powerup != cs_frog)
                        xspeed += acc;
                    else {
                    
                        //If Mario is not holding or is not riding a yoshi or a kuribo shoe.
                        if ((holding == 0) && (global.mount == 0))                              
                            xspeed += accfrog;
                        else
                            xspeed += acc;
                    }
                }
                else { //Otherwise, if the player's speed is lower than 0.
                
                    //Add 'accskid' to xspeed;
                    xspeed += accskid;
                }
            }
            else { //Otherwise, if the player is overlapping a slippery surface.
            
                //If the player's horizontal speed is equal/greater than 0.
                if (xspeed >= 0) {
                
                    //Add 'acc' to xspeed.
                    if (global.powerup != cs_frog)
                        xspeed += acc/2;
                    else {
                    
                        //If Mario is not holding or is not riding a yoshi or a kuribo shoe.
                        if ((holding == 0) && (global.mount == 0))                              
                            xspeed += accfrog/2;
                        else
                            xspeed += acc/2;
                    }
                }
                else { //Otherwise, if the player's speed is lower than 0.
                
                    //Add 'accskid' to xspeed.
                    xspeed += accskid/2;
                }                                              
            }
        }
    }
    
    //Otherwise, if the player holds the 'Left' key and the 'Right' key is not being held.
    else if ((keyboard_check(global.leftkey)) && (move) && (wallkick == 0) && (!keyboard_check(global.rightkey))) {
                
        //Set the facing direction    
        if ((holding == 2) && (xscale != -1)) {
        
            turning = 1;
            alarm[2] = 6;
        }
        
        //If the player is not overlapping a wall
        if (!collision_rectangle(bbox_left,bbox_top+4,bbox_right,bbox_top+4,obj_solid,0,0))
            xscale = -1;
        
        //Check up the player's horizontal speed.
        if (xspeed > -xspeedmax) {
                
            //Make the player move horizontally.
            if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0)) 
            || (global.powerup == cs_penguin) { //If the player is not overlapping a slippery surface.
                
                //If the player's horizontal speed is equal/lower than 0.
                if (xspeed <= 0) {
                
                    //Add 'acc' to xspeed.
                    if (global.powerup != cs_frog)
                        xspeed += -acc;
                    else {
                    
                        //If Mario is not holding or is not riding a yoshi or a kuribo shoe.
                        if ((holding == 0) && (global.mount == 0))                              
                            xspeed += -accfrog;
                        else
                            xspeed += -acc;
                    }
                }
                else { //Otherwise, if the player's speed is greater than 0.
                
                    //Add 'accskid' to xspeed;
                    xspeed += -accskid;
                }
            }
            else { //Otherwise, if the player is overlapping a slippery surface.
            
                //If the player's horizontal speed is equal/lower than 0.
                if (xspeed <= 0) {
                
                    //Add 'acc' to xspeed.
                    if (global.powerup != cs_frog)
                        xspeed += -acc/2;
                    else {
                    
                        //If Mario is not holding or is not riding a yoshi or a kuribo shoe.
                        if ((holding == 0) && (global.mount == 0))                              
                            xspeed += -accfrog/2;
                        else
                            xspeed += -acc/2;
                    }
                }
                else { //Otherwise, if the player's speed is greater than 0.
                
                    //Add 'accskid' to xspeed.
                    xspeed += -accskid/2;
                }                                              
            }
        }
    }
    
    //Otherwise if the player is on contact with the ground, slowdown him until he stops.
    else if (yspeed == 0) { 
    
        //If the player is not overlapping a slippery surface.
        if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_slippery,0,0))
        || ((global.mount == 2) && (global.mountcolour == 4))
        || (global.powerup == cs_penguin) {
        
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

//Prevent the player from moving too fast
if (state != 2) {

    //Check if the player has the shell powerup, it is not riding anything nor holding anything and running
    if (global.powerup == cs_shell)
    && (global.mount == 0)
    && (holding = 0)
    && (pmeter >= 112) 
    && (keyboard_check(global.downkey)) {
    
        //Force sliding
        sliding = true;
    }
    
    //Check the horizontal speed
    if (xspeed > xspeedmax)
        xspeed = xspeedmax;
    if (xspeed < -xspeedmax)
        xspeed = -xspeedmax;
}

//If the player is jumping
if ((state == 2) || (delay != 0)) {
    
    //Variable jumping
    if (yspeed < -2) && (jumping == 1)
        ygrav = grav_alt;
    
    //Otherwise, use default gravity.     
    else {
        
        //Use default gravity
        ygrav = grav;
                
        //End variable jumping if it never ends manually.
        if (jumping = 1)
            jumping = 2;
    }
    
    //Propeller player jumping
    if (global.powerup == cs_propeller) {

        //If the player is spin jumping normally
        if ((stompstyle != 0) && (global.mount == 0)) {
           
            //Lower the gravity
            ygrav = ygrav/2.25;

            //Allow the player to charge downwards
            if ((keyboard_check(global.downkey)) && (yspeed > 0)) {
            
                //Do stompstyle
                stompstyle = 1;
                
                //Stop horizontal movement
                xspeed = 0
                
                //Cap vertical speed
                if (yspeed < 4)
                    yspeed += 0.25;            
            }
            else {
            
                //Keep stompstyle
                stompstyle = 2;
            
                //Cap vertical speed
                if (yspeed > 1)
                    yspeed = 1;
            }

            //Play the sound when he charges downwards
            if (keyboard_check_pressed(global.downkey))
                audio_play_sound(snd_spin, 0, false)
        }
    }

    //If the player is using the raccoon or the tanooki powerup.
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
&& (keyboard_check(global.upkey)) {

    //Change to climbing state
    state = 3;
    
    //Stop movement
    yspeed = 0;
    ygrav = 0;    
}

//Makes the player butt-slide down slopes
if (keyboard_check_pressed(global.downkey)) 
&& (!disablecontrol) {

    //If the player does have the penguin suit
    if ((global.powerup == cs_shell)
    || ((global.powerup == cs_penguin) && (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_slippery, 1, 0))))
    && (global.mount == 0)
    && (state == 1)
    && (!sliding)
    && ((holding == 0) || (holding == 4)) {
    
        //Start sliding
        sliding = true;
        
        //Boost slide if overlapping a semisolid
        if (place_meeting(x,bbox_bottom+1,obj_semisolid))
        && (xspeed == 0)
            xspeed = 0.05*sign(xscale);     
    }

    //If the player is on a slope, and the above didn't happen, slide normally
    else if (collision_rectangle(x-1,bbox_bottom+1,x+1,bbox_bottom+2,obj_slopeparent,1,0))
    && (!collision_rectangle(x-1,bbox_bottom+1,x+1,bbox_bottom+2,obj_hawkmouth,0,0))
    && (global.powerup != cs_frog) {
            
        //If the player can slide and it's not holding anything.
        if ((holding == 0) || (holding == 4)){
        
            //Start sliding
            sliding = true;
            
            //Boost slide if overlapping a semisolid
            if (place_meeting(x,bbox_bottom+1,obj_semisolid))
                xspeed = 0.05*sign(xscale);        
        }
                
        //Otherwise, just crouch down if the player can do it.
        else
            crouch = true;
    }
}

//If the player is jumping, not ducking, not spin jumping, can control himself, is not riding anything and it's not holding a propeller block
if (state == 2)
&& (!stompstyle)
&& (!disablecontrol) {

    //If a propeller block is being held, do not use powerups
    if (instance_exists(obj_propellerblock_up)) 
    && (obj_propellerblock_up.held)
        exit;

    //If the player does have either the raccoon or the tanooki powerup
    if ((global.powerup == cs_leaf) || (global.powerup == cs_tanooki))
    && (jumping != 1)
    && (wallkick < 1)
    && (swimming == false)
    && (keyboard_check_pressed(global.shiftkey)) 
    && (!collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_quicksand,0,0)) {
    
        //If the player is running or the pwing is active
        if (run) 
        || (global.pwing == 1) {
        
            //Play 'tail' sound.
            audio_stop_sound(snd_spin);
            audio_play_sound(snd_spin, 0, false);
            
            //Make the player able to fly for 4 seconds
            if (!flying) {
            
                flying = true;
                alarm[9] = 60 * global.flighttime;
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
                    yspeed  = max(yspeed + 0.05, 0);
                else
                    yspeed = 0;
            }
        }
        
        //Otherwise, if the player is not running.
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
    
    //Handles carrot and bee Mario's floating
    else if ((global.powerup == cs_carrot) 
    || ((global.powerup == cs_bee) && (beefly < 128)))
    && (!crouch)
    && (wallkick < 1)
    && (global.mount == 0)
    && (keyboard_check(global.shiftkey)) {

        //If Mario is moving downwards
        if (yspeed > 0) {

            //Set the floating variable
            isfloating = 1;

            //Bee Mario flies upwards if the ceiling is not above him
            if (global.powerup == cs_bee)
            && ((!collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_solid,0,0))
            || (!collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_top,obj_ceilslopeparent,1,0))) {

                //Fly upwards
                yspeed = -1;

                //Make the bee timer tick extra because of the initial push
                beefly += 8;
            }

            //Carrot Mario floats down slowly
            else
                yspeed = 0.5;
        }

        //If Mario is not moving downwards
        else {

            //If bee Mario is floating
            if ((global.powerup == cs_bee) && (beefly < 128) && (isfloating)) {

                //Continue flying upwards
                yspeed = -1;

                //Make the bee timer tick
                beefly++

                //Slow bee Mario down if he is moving too fast
                if (xspeed > 1)
                    xspeed -= 0.1;
                if (xspeed < -1)
                    xspeed += 0.1;
            }

            //Stop floating otherwise
            else
                isfloating = false;
        }
    }

    //Stop floating
    else
        isfloating = false;
}

//Stop floating
else
    isfloating = false;

//If carrot or bee Mario is floating, but the sound is not playing
if ((isfloating) && (!floatnow)) {

    //Mark that the sound is playing
    floatnow = true;

    //Loop the sound
    audio_play_sound(snd_spin,0,1);
}

//If carrot or bee Mario is not floating, but the sound is playing
else if ((!isfloating) && (floatnow)) {

    //Mark that the sound is not playing
    floatnow = false;

    //Stop the sound
    audio_stop_sound(snd_spin)
}
