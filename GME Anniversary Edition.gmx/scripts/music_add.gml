///music_add(section)

/*
**  Usage:
**      music_add(section)
**
**  Argument:
**      The INI file section to look at
**
**  Return:
**      An instance ID of the music file added
*/

//Look up for the song
var section = argument[0];
var filename = ini_read_string(section, "songname", "none");

//Return this
return FMODSoundAdd("music/" + filename, 0, 0);
