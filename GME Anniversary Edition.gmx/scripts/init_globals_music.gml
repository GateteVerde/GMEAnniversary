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

//Overworld
global._theme_land = music_add("Land");
music_setup(global._theme_land, "Land", 3);

//Starman
global._theme_starman = music_add("Starman");
music_setup(global._theme_starman, "Starman", 3);

//Underground
global._theme_underground = music_add("Underground");
music_setup(global._theme_underground, "Underground", 3);
