///save(file)

/*
**  Usage:
**      save(file)
**
**  Given:
**      file    The location of the save file.
*/

//Open the file
var file = file_text_open_write(argument[0]);

//Turn the world map data structure into a string and write it
file_text_write_string(file,ds_map_write(global.mapscreen));
file_text_writeln(file);

//Turn the star coin data structure into a string and write it
for (var i = 0; i < 3; i++) {

    file_text_write_string(file,ds_map_write(global.sc[i]));
    file_text_writeln(file);
}

//Current World
file_text_write_string(file,base64_encode(string(global.world)));
file_text_writeln(file);

//Current Exits
file_text_write_string(file,ds_map_write(global.exits));
file_text_writeln(file);

//Current Alt Exits
file_text_write_string(file,ds_map_write(global.exits2));
file_text_writeln(file);

//Star Coins
file_text_write_string(file,base64_encode(string(global.starcoins)));
file_text_writeln(file);

//Coins
file_text_write_string(file,base64_encode(string(global.coins)));
file_text_writeln(file);

//Lives
file_text_write_string(file,base64_encode(string(lives)));
file_text_writeln(file);

//Score
file_text_write_string(file,base64_encode(string(score)));
file_text_writeln(file);

//Current Powerup
file_text_write_string(file,base64_encode(string(global.powerup)));
file_text_writeln(file);

//Reserve Item
file_text_write_string(file,base64_encode(string(global.reserve)));
file_text_writeln(file);

//Red Switch Palace
file_text_write_string(file,base64_encode(string(global.palacered)))
file_text_writeln(file);

//Blue Switch Palace
file_text_write_string(file,base64_encode(string(global.palaceblue)))
file_text_writeln(file);

//Yellow Switch Palace
file_text_write_string(file,base64_encode(string(global.palaceyellow)))
file_text_writeln(file);

//Green Switch Palace
file_text_write_string(file,base64_encode(string(global.palacegreen)))
file_text_writeln(file);

//Yoshi
file_text_write_string(file,base64_encode(string(global.mount)))
file_text_writeln(file);

//Yoshi's Color
file_text_write_string(file,base64_encode(string(global.mountcolour)))
file_text_writeln(file);

//Inventory Items
for (var i = 0; i < 13; i++) {

    file_text_write_string(file,base64_encode(string(global.inventory[i])));
    file_text_writeln(file);
}

//100% Game Completion
file_text_write_string(file,base64_encode(string(global.gameclear)));
file_text_writeln(file);

//Close the file
file_text_close(file);
