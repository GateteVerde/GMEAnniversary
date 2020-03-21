///init_globals()

/*
**  Usage:
**      init_globals()
**
**  Purpose:
**      Initializes all of the global variables used throughout the game.
*/

//Gamepad
global.gamepad = false;

//Cheats
global.cheats = false;

//World Number
global.world = 1;

//Level ID (Used for star coin management)
global.level = 0;

//How many level does the game have? 
//(Make sure is 1 number higher than the amount of levels)
global.levelmax = cs_levels;

//Exits found
global.exits = ds_map_create();
global.exits2 = ds_map_create();

//Level time
global.time = 0;

//Level skid
global.skin = 0;

//Lives
lives = 5;

//Score
score = 0;

//Health
health = 2;

//Skin
//0: No skin
//1: Underground
//2: Castle
global.skin = 0;

//Coins
global.coins = 0;

//Red Coins
global.redcoins = 0;

//Silver Coins
global.silvercoins = 0;

//Current Player
global.player = 0;

//Whether the player died on a level
global.died = 0;

//Display 'Mario Start!'
global.mariostart = false;

//Checks whether a level is cleared
//0: No clear
//1: Clear
//2: Clear (Secret Exit)
//3: Clear (Exit from side)
global.clear = 0;

//SMB3 Card System
global.card[0] = -1;
global.card[1] = -1;
global.card[2] = -1;

//Berries
global.berries = 0;

//Cherries
global.cherries = 0;

//Powerup
global.powerup = cs_small;

//Reserve item
global.reserve = cs_small;
global.reservedrop = true;

//Checkpoint
global.checkpoint = noone;

//Checkpoint Room
global.checkpointroom = noone;

//Fireworks
global.fireworks = 0;

//Switch Palaces
global.palaceyellow = 0;
global.palacegreen = 0;
global.palacered = 0;
global.palaceblue = 0;

//On / Off Blocks
global.onoffyellow = 1;
global.onoffgreen = 1;
global.onoffred = 1;
global.onoffblue = 1;

//Position change object type
//-1: No Change
//0: Mario
//1: Pipe
//2: Jump
//3: Climb
global.postchange = -1;

//Position change coordinates
global.postx = 0;
global.posty = 0;

//Mount
//0: No mount
//1: Yoshi
//2: Kuribo Shoe
global.mount = 0;

//Mount colour
//0: Green
//1: Red
//2: Yellow
//3: Blue
//4: Teal (Does not affect Kuribo shoes, only Yoshi)
//5: Pink (Does not affect Kuribo shoes, only Yoshi)
global.mountcolour = 0;

//P-Switch time limit
global.pswitch = 0;

//G-Switch time limit
global.gswitch = 0;

//Star time limit
global.starman = 0;

//Star used in map?
global.mapstar = 0;

//P-Wing active?
global.pwing = 0;

//Warp used in map
global.pipex = 0;
global.pipey = 0;

//Mushroom house prizes
global.prize[0] = 0;
global.prize[1] = 0;
global.prize[2] = 0;

//Map pipe area type
global.pipetype = 0;

//Level music variable
global.levelmusic = bgm_gameover;

//Data structure for opened doors
global.doors = ds_map_create();

//Data structure for collected ace coins
global.acecoins = ds_map_create();

//Data structure for collected red coin rings
global.redrings = ds_map_create();

//Item that is being carried between rooms
global.carrieditem = noone;

//The sprite used by an item carried between rooms
global.carriedsprite = noone;

//The object to return when carrying a SMB2 enemy between rooms
global.turnback = 0;

//Initialize star coin system
//0: Not collected
//1: Collected, not saved
//2: Collected, saved with checkpoint
//3: Collected, saved with level completion. (Adds to global.sc_count)
for (var i = 0; i < 3; i++) {

    global.sc[i] = ds_map_create();
    for (var j = 0; j < global.levelmax; j++)
        ds_map_add(global.sc[i],j,0);
}

//Star Coins collected
global.starcoins = 0;

//Data structure for storing the state of the world map.
global.mapscreen = ds_map_create();

//Map inventory variables
for (var i=0; i<13; i++) {

    global.inventory[i] = 0;
}
    
//100% game completion variable
global.gameclear = 0;
