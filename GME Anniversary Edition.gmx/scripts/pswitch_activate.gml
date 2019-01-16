///pswitch_activate();

/*
**  Usage:
**      pswitch_activate();
**
**  Function:
**      Turns on the P-Switch effect
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

//Turn blue switches visible
with (obj_trampoline_p) {

    //Create a carryable trampoline
    instance_create(x,y,obj_trampoline_p_active);
    
    //Destroy the trampoline
    instance_destroy();
}

//Make P-Coins visible
with (obj_coin_p) visible = true;

//Make P-Doors visible
with (obj_door_p) visible = true;

//Stop conveyor belts movement
with (obj_conveyor_r) image_speed = 0;
with (obj_conveyor_l) image_speed = 0;

//Turn munchers into coins
with (obj_muncher) {

    //Create a muncher coin
    instance_create(x,y,obj_coin_m);
    
    //Destroy
    instance_destroy();
}

//Make P-blocks visible
with (obj_pblock) {

    //Create a solid
    mysolid = instance_create(x,y,obj_solid);
    
    //Make visible
    visible = true;
}

//Make P-blocks visible
with (obj_qblock_p) {

    //Create a solid
    mysolid = instance_create(x,y,obj_solid);
    
    //Make visible
    visible = true;
}
