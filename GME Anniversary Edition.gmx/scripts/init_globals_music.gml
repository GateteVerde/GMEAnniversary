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

//Plains
global._theme_plains = music_add("Plains");
music_setup(global._theme_plains, "Plains", 3);
