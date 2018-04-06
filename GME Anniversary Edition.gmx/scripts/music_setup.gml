///music_setup(musicvar,section,group)

/*
**  Usage:
**      music_setup(musicvar,section,group)
**
**  Argument:
**      musicvar: variable in which to store the music
**      section: Ini section where the music is
**      group: Group to classify the music
*/

/*
var musicvar = argument[0];
var section = argument[1];
var group = argument[2]
var myvolume = ini_read_real(section,"volume",100);
var songvolume = 1 * (myvolume / 100);
var myloopS = ini_read_real(section,"loopS",0);
var myloopE = ini_read_real(section,"loopE",1);

FMODSoundSetGroup(musicvar, group);
FMODSoundSetMaxVolume(musicvar, songvolume);
FMODSoundSetLoopPoints(musicvar, myloopS, myloopE);
