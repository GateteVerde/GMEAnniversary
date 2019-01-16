///pswitch_deactivate();

/*
**  Usage:
**      pswitch_deactivate();
**
**  Function:
**      Turns off the P-Switch effect
*/

//Turn bricks into coins.
with (obj_brick) {

    //If the sprite is not a green brick
    if (sprite_index != spr_greenbrick) {
    
        //Create a coin from the brick.
        instance_create(x,y,obj_coinchange);
        
        //Destroy the brick
        instance_destroy();
    }
}

//Turn coins into bricks.
with (obj_coin) {

    //Create a brick from the coin.
    instance_create(x,y,obj_brick);
    
    //Destroy the brick.
    instance_destroy();
}

//Turn fake coins into coins.
with (obj_coinchange) {

    //Create a coin from the fake coin.
    instance_create(x,y,obj_coin);
    
    //Destroy the brick
    instance_destroy();    
}

//Destroy the trampoline
with (obj_trampoline_p_active) {

    //Create new trampoline
    instance_create(xstart,ystart,obj_trampoline_p);
    
    //Destroy the trampoline
    instance_destroy();
}

//Make P-Coins invisible
with (obj_coin_p) visible = false;

//Make P-Doors invisible
with (obj_door_p) visible = false;

//Stop conveyor belts movement
with (obj_conveyor_r) image_speed = 1;
with (obj_conveyor_l) image_speed = -1;

//Turn munchers back
with (obj_coin_m) {

    //Create a muncher coin
    instance_create(x,y,obj_muncher);
    
    //Destroy
    instance_destroy();
}

//Make P-blocks visible
with (obj_pblock) {

    //Destroy solid
    with (mysolid) instance_destroy();
    
    //Make visible
    visible = false;
}

//Make P-blocks visible
with (obj_qblock_p) {

    //Destroy solid
    with (mysolid) instance_destroy();
    
    //Make visible
    visible = false;
}
