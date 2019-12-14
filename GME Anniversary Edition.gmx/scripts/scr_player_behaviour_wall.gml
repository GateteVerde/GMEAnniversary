///scr_player_behaviour_wall()

/*
**  Usage:
**      scr_player_behaviour_wall()
**
**  Purpose:
**      Handles the actions of a player what they are in contact of a wall.
*/

if (yspeed > 0) 
&& (!crouch) 
&& (!flying)
&& (!stompstyle) 
&& (holding == 0)
&& (global.pwing = 0)
&& (global.mount = 0) 
&& (!instance_exists(obj_spinner)) {
        
    //If the 'Right' key is pressed and the player is facing right.
    if ((keyboard_check(global.rightkey)) && (xscale == 1)) {
    
        //Check for a wall at the right
        wall_r = collision_line(bbox_right,bbox_top+4,bbox_right+2,bbox_bottom-4,obj_solid,0,1);
        
        //If the player hugs a wall at the right
        if (wall_r) {
            
            //Enable wallkick
            wallkick = 1;
            wallready = 0;
            
            //Enable gravity if disabled
            if (disablegrav > 0)
                disablegrav = 0;
        }            
        else
            wallkick = 0;
    }
    
    //Otherwise, if the 'Left' key is pressed and the player is facing left.
    else if ((keyboard_check(global.leftkey)) && (xscale == -1)) {
    
        //Check for a wall to the left
        wall_l = collision_line(bbox_left-1,bbox_top+4,bbox_left,bbox_bottom-4,obj_solid,0,1);
    
        //If the player hugs a wall at the left
        if (wall_l) {
            
            //Enable wallkick
            wallkick = 1;
            wallready = 1;
            
            //Enable gravity if disabled
            if (disablegrav > 0)
                disablegrav = 0;
        }
        else
            wallkick = 0;
    }
    else
        wallkick = 0;
}

//Handle wall kick
if (wallkick == 1) {

    //End manually wall kick when not in-air or swimming.
    if ((state < 2) || (swimming))
        wallkick = 0;
        
    //End manually wall kick when not in contact with a wall.
    if ((xscale < 0) && (!collision_line(bbox_left-1,bbox_top+4,bbox_left,bbox_bottom-1,obj_solid,0,1)))
    || ((xscale > 0) && (!collision_line(bbox_right,bbox_top+4,bbox_right+2,bbox_bottom-1,obj_solid,0,1)))
        wallkick = 0;

    //If the player does have the cat powerup.
    if ((global.powerup == cs_cat) && (keyboard_check(global.upkey))) {
    
        //If the player can climb
        if (catclimbing < (global.cattime * 60)) {
                
            //Increase cat climb
            catclimbing++;    
            
            //Move up
            yspeed -= 0.5;
            
            //No grav
            ygrav = 0;
            
            //Prevent the player from climbing too fast.
            if (yspeed < -1.5)
                yspeed = -1.5;  
        }
        else if (catclimbing == (global.cattime * 60)) {
            
            //Set the gravity
            ygrav = 0.03;
            
            //Prevent the player from falling too fast.
            if (yspeed > 1.5)
                yspeed = 1.5;
        }
    }
    
    //Otherwise, if the player does not have the cat powerup
    else {
    
        //Set the gravity
        ygrav = grav;
    
        //Prevent the player from falling too fast
        if (yspeed > 1.5)
            yspeed = 1.5;
    }

    //If the 'Jump' key is being pressed.
    if (keyboard_check_pressed(global.shiftkey)) {
    
        //Set the vertical speed
        yspeed = jumpstr*-1.047;
        
        //Perform spin jump if 'Up' is pressed and Mario does not have the Propeller or Cat powerups
        if (keyboard_check(global.upkey)) 
        && (global.powerup != cs_propeller) 
        && (global.powerup != cs_cat) {
        
            //Play 'Spin' sound
            audio_play_sound(snd_spin, 0, false);
        
            //Set spin jump mode
            stompstyle = 1;
        }
        
        //Allow variable jump
        jumping = 1;
        
        //Allow wallkick
        alarm[7] = 20;
    
        //If the 'Right' key is pressed and the player is facing right.
        if (xscale > 0) {
        
            //Set the horizontal speed
            xspeed = xspeedmax*-0.8;
            
            //Move 2 pixels to the left
            x -= 2;
            
            //End walljump
            wallkick = 2;
            
            //Facing direction
            xscale = -1;
            
            //Play 'Stomp' sound
            audio_play_sound(snd_stomp,1,0);
            
            //Create effect
            with (instance_create(bbox_right,y+8,obj_smoke))
                sprite_index = spr_spinthump;
        }
        
        //Otherwise, if the 'Left' key is pressed and the player is facing left.
        else if (xscale < 0) {
        
            //Set the horizontal speed.
            xspeed = xspeedmax*+0.8;
            
            //Perform spin jump if 'Up' is pressed and Mario does not have the Propeller or Cat powerups
            if (keyboard_check(global.upkey)) 
            && (global.powerup != cs_propeller) 
            && (global.powerup != cs_cat) {
            
                //Play 'Spin' sound
                audio_play_sound(snd_spin, 0, false);
            
                //Set spin jump mode
                stompstyle = 1;
            }
            
            //Move 2 pixels to the right
            x += 2;
                        
            //End walljump
            wallkick = 2;            
            
            //Facing direction
            xscale = 1;
            
            //Play 'Stomp' sound
            audio_play_sound(snd_stomp,1,0);
            
            //Create effect
            with (instance_create(bbox_left,y+8,obj_smoke))
                sprite_index = spr_spinthump;        
        }
    }
}
