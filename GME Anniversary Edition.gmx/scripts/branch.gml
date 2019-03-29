#define branch
//In order to create branch based scripts, make sure you follow these guidelines

{
    /*
    **  If you want to use coins, make sure to use the 'coins' variable that is inside obj_warpbranch.
    **  
    **  {
    **      if (coins > 0) && (coins < 9) {
    **
    **          if (instance_number(obj_fadein) == 0)
    **              with (instance_create(0,0,obj_fadein)) target = rm_test; 
    **      }
    **  }
    **
    **  For time, use the 'global.time' variable. And for collected A-coins use 'ds_map_size(global.acecoins)'.
    */    
}

#define branch_waterfallcaverns
{
    //If the time is lower than 300 seconds, get main exit
    if (global.time < 300)    
        myroom = rm_waterfallcaverns_d;
    
    //Otherwise, if the time is greater than 300, get secret exit
    else
        myroom = rm_waterfallcaverns_e;
}
