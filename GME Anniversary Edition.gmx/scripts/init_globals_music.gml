///init_globals_music()

/*
**  Usage:
**      init_globals_music()
**
**  Purpose:
**      Initializes all of the music variables used throughout the game.
**
**  Notes:
**      See 'obj_musicplayer_persistent' for details about the music.
*/

//Athletic
global._theme_athletic = music_add("Athletic");
music_setup(global._theme_athletic, "Athletic", 3);

//Bonus
global._theme_bonus = music_add("Bonus");
music_setup(global._theme_bonus, "Bonus", 3);

//Gameover
global._theme_gameover = music_add("Gameover");
music_setup(global._theme_gameover, "Gameover", 3);

//Land
global._theme_land = music_add("Land");
music_setup(global._theme_land, "Land", 3);

//Map 1
global._theme_map1 = music_add("Map 1");
music_setup(global._theme_map1, "Map 1", 1);

//Map 2
global._theme_map2 = music_add("Map 2");
music_setup(global._theme_map2, "Map 2", 1);

//Miss
global._theme_miss = music_add("Miss");
music_setup(global._theme_miss, "Miss", 2);

//PSwitch
global._theme_pswitch = music_add("PSwitch");
music_setup(global._theme_pswitch, "PSwitch", 3);

//SM3 - Clear A
global._theme_sm3cleara = music_add("SM3 - Clear A");
music_setup(global._theme_sm3cleara, "SM3 - Clear A", 2);

//SM3 - Clear B
global._theme_sm3clearb = music_add("SM3 - Clear B");
music_setup(global._theme_sm3clearb, "SM3 - Clear B", 2);

//SM3 - Clear C
global._theme_sm3clearc = music_add("SM3 - Clear C");
music_setup(global._theme_sm3clearc, "SM3 - Clear C", 2);

//SMW - Clear A
global._theme_smwcleara = music_add("SMW - Clear A");
music_setup(global._theme_smwcleara, "SMW - Clear A", 2);

//SMW - Clear B
global._theme_smwclearb = music_add("SMW - Clear B");
music_setup(global._theme_smwclearb, "SMW - Clear B", 2);

//Starman
global._theme_starman = music_add("Starman");
music_setup(global._theme_starman, "Starman", 3);

//Underground
global._theme_underground = music_add("Underground");
music_setup(global._theme_underground, "Underground", 3);
