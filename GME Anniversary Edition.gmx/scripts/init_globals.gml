///init_globals()

/*
**  Usage:
**      init_globals()
**
**  Purpose:
**      Initializes all of the global variables used throughout the game.
*/

//World Number
global.world = "1";

//Level Number
global.level = "1";

//Level id
global.lvlid = 0;

//Level time
global.time = 0;

//Lives
lives = 5;

//Score
score = 0;

//Health
health = 3;

//Coins
global.coins = 0;

//Current Player
global.player = 0;

//Display 'Mario Start!'
global.ms = false;

//Checks whether a level is cleared
//0: No clear
//1: Clear
//2: Clear (Secret Exit)
global.clear = 0;

//Powerup
global.powerup = cs_cat;

//Reserve item
global.reserve = cs_small;

//Checkpoint
global.checkpoint = noone;

//Checkpoint Room
global.checkpointroom = noone;

//Red Switch Palace
global.palacered = 0;

//Blue Switch Palace
global.palaceblue = 0;

//Yellow Switch Palace
global.palaceyellow = 0;

//Green Switch Palace
global.palacegreen = 0;

//Position change object type
//-1: No Change
//0: Mario
//1: Pipe
//2: Jump
//3: Climb
//4: Warp/Mystery Boxes
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
global.mountcolour = 0;

//P-Switch time limit
global.pswitch = 0;

//Star time limit
global.starman = 0;

//Star used in map
global.mapstar = 0;

//Mushroom house prizes
global.prize[0] = 0;
global.prize[1] = 0;
global.prize[2] = 0;

//Map pipe area type
global.pipetype = 0;

//Map inventory variables
for(var i=0; i<16; i++)
    global.inventory[i] = 0;
