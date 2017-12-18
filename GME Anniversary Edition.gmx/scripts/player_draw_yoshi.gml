///player_draw_yoshi(sprite,frame,x,y,xscale)

/*
**  Usage:
**      player_draw_yoshi(sprite,frame)
**
**  Given:
**      sprite  :   sprite to use
**      frame   :   frame to be used
**      x       :   x position
**      y       :   y position
**      xscale  :   facing direction
**
**  Purpose:
**      Draws the player at the given coordinates
*/

//Set the palette
pal_swap_set(spr_palette_mario, isflashing);

//Draw the player
draw_sprite_ext(argument[0],argument[1],round(argument[2]),round(argument[3])+1,image_xscale,1,0,c_white,image_alpha);

//Reset palette
pal_swap_reset();
