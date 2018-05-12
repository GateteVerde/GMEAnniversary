///set_keys(key,keytext,keydefault);

/*
**  Usage:
**      set_keys(key,keytext,keydefault)
**
**  Given:
**      key         Key to modify
**      keytext     Text to display (In quotes)
**      keydefault  Default key to set
*/

ID = instance_create(0,0,obj_titlemenu_key);
    ID.key          = argument[0];
    ID.keyText      = argument[1];
    ID.keyDefault   = argument[2];
