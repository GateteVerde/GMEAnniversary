///scr_global_transform()

/*
**  Usage:
**      scr_global_transfrom()
**
**  Purpose:
**      Calls the appropiate transforming sprite for the correct character
**
**  Notes:
**      Use only on obj_mario_transform
*/

//Mario
if (global.player == 0) {

    switch (sequence) {
    
        //Small to Big
        case (0): { 
        
            sprite_index = spr_mario_grow;
            image_speed = 0.25;
        } break;
        
        //Big to Small
        case (1): {
        
            sprite_index = spr_mario_shrink;
            image_speed = 0.25;
        } break;
        
        //Power up
        case (2): {
        
            sprite_index = spr_mario_powerup;
            image_speed = 0.25;
            loop = 3;
        } break;
        
        //Power down
        case (3): {
        
            sprite_index = spr_mario_powerdown;
            image_speed = 0.3;
            loop = 6;
        } break;
        
        //Transform
        case (4): {
        
            sprite_index = spr_mario_transform;
            image_speed = 0.3;
        } break;
    }
}
