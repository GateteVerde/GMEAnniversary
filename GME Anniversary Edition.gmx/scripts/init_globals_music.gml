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

//Overworld
global._theme_overworld = music_add("Overworld");
music_setup(global._theme_overworld, "Overworld", 3);

//Starman
global._theme_starman = music_add("Starman");
music_setup(global._theme_starman, "Starman", 3);
