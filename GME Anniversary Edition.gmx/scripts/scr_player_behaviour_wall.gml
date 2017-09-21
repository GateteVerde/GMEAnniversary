///scr_player_behaviour_wall()

/*
**  Usage:
**      scr_player_behaviour_wall()
**
**  Purpose:
**      Handles the actions of a player what they are in contact of a wall.
*/



if (yspeed > 0) 
//&& (!duck) 
//&& (!spin) 
&& (!flying)
//&& (!holding) 
//&& (raccoon = 0) 
&& (global.powerup != cs_frog) 
//&& (global.mounttype = 0) 
/*&& (!collision_point(x,y,obj_qsand,1,0))*/ {
    
    /*if (!instance_exists(obj_spinner))*/ {
        
        if ((keyboard_check(vk_right)) && (xscale == 1)) {
            
            if (collision_line(bbox_right,bbox_top,bbox_right+2,bbox_bottom,obj_solid,0,1))
            /*&& (!collision_line(bbox_right+hspeed,y+boundary+3,bbox_right+1+hspeed,y+boundary+3,obj_slopeparent_i,0,1))*/ {
                
                wallkick = 1;
                wallready = 0;
            }            
            else
                wallkick = 0;
        }
        else if ((keyboard_check(vk_left)) && (xscale == -1)) {
            
            if (collision_line(bbox_left-2,bbox_top,bbox_left,bbox_bottom,obj_solid,0,1)) 
            /*&& (!collision_line(bbox_left-1+hspeed,y+boundary+3,bbox_left+hspeed,y+boundary+3,obj_slopeparent_i,0,1))*/ {
                
                wallkick = 1
                wallready = 1
            }
            else
                wallkick = 0;
        }
        else
            wallkick = 0
    }
}

if ((state < 2) || (swimming)) || (sliding)
wallkick = 0

else if ((wallkick == 1) && (global.powerup == cs_cat)) {

    if (catclimbing < global.cattime * 60)    
    catclimbing++;
    
    else
    {
        if (keyboard_check(vk_up)) {
        
            yspeed -= 0.5;
            
            if (yspeed < -2)
            yspeed = -2        
        }
        
        else if (keyboard_check(vk_down)) {
        
            yspeed += 0.5;
            
            if (yspeed > 1.25)
            yspeed = 1.25        
        }
        
        else if (!keyboard_check(vk_up))
        && (!keyboard_check(vk_down))    
        && (catclimbing != global.cattime * 60)
        yspeed = 0; 
    }
    
    if (keyboard_check_pressed(vk_shift)) {
    
        yspeed = jumpstr*-1.047
        jumping = 1
        alarm[7] = 20
        
        if (xscale > 0) 
        && (keyboard_check(vk_right)) 
        && (!keyboard_check(vk_left)) {
                    
            xspeed = xspeedmax*-0.8                     
            x -= 2
            xscale = -1;
            wallkick = 3
        }
        
        if (xscale < 0) 
        && (keyboard_check(vk_left)) 
        && (!keyboard_check(vk_right)) {
        
            xspeed = xspeedmax*+0.8            
            x += 2
            xscale = 1;
            wallkick = 2       
        }
    }
    
    if (yspeed > 2)
        yspeed = 2      
}

else if ((wallkick == 1) && (global.powerup != cs_cat)) {

    if (keyboard_check_pressed(vk_shift)) {
    
        yspeed = jumpstr*-1.047
        jumping = 1
        alarm[7] = 20
    
        if (xscale > 0) 
        && (keyboard_check(vk_right)) 
        && (!keyboard_check(vk_left)) {
        
            xspeed = xspeedmax*-0.8
            x -= 2
            xscale = -1;
            wallkick = 3
            //audio_play_sound(snd_stomp,1,0);
            ID = instance_create(x+3,y+8,obj_smoke)
                ID.sprite_index = spr_spinthump;
        }
        
        if (xscale < 0) 
        && (keyboard_check(vk_left)) 
        && (!keyboard_check(vk_right)) {
        
            xspeed = xspeedmax*+0.8
            x += 2
            xscale = 1;
            wallkick = 2
            //audio_play_sound(snd_stomp,1,0);
            ID = instance_create(x-9,y+8,obj_smoke)
                ID.sprite_index = spr_spinthump;        
        }
    }
    
    if (yspeed > 1)
        yspeed = 1      
}
