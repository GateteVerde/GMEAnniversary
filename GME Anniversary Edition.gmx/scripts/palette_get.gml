///palette_get();

/*
**  Usage:
**      palette_get();
**
**  Purpose:
**      Returns the correct palette for the sprite.
*/

//Check if the skin must be used first
if (global.skin != 0) {

    //Seek for the sprite first
    switch (sprite_index) {
    
        //Question Blocks
        case (spr_qblock):
        case (spr_qblock_2x):
        case (spr_qblock_3x): 
            return spr_palette_qblock;
            
        //Bricks
        case (spr_brick):
        case (spr_shard):
            return spr_palette_brick;
        
        //Empty Blocks
        case (spr_qblock_empty):
        case (spr_qblock_2x_empty):
        case (spr_qblock_3x_empty): 
            return spr_palette_qblock_empty;            
    }
}

//Otherwise, return the default palette
else
    return pal_null;
