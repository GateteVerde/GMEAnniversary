///constant_get_sprite(variable)

/*
**  Usage:
**      constant_get_sprite(variable)
**
**  Given:
**      variable    A constant
**
**  Returns:
**      The sprite_index that represents that constant.
*/

switch (argument[0]) {

    case (cs_big): return spr_mushroom;
    case (cs_fire): return spr_fireflower;
    case (cs_ice): return spr_iceflower;
    case (cs_carrot): return spr_carrot;
    case (cs_leaf): return spr_leaf;
    case (cs_frog): return spr_frogsuit;
    case (cs_tanooki): return spr_tanookisuit;
    case (cs_hammer): return spr_hammerflower;
    case (cs_boomerang): return spr_boomerangflower;
    case (cs_super): return spr_superflower;
    case (cs_bomb): return spr_bombshroom;
    case (cs_shell): return spr_blueshell;
    case (cs_bee): return spr_beeshroom;
    case (cs_lightning): return spr_voltshroom;
    case (cs_penguin): return spr_penguinsuit;
    case (cs_propeller): return spr_propellershroom;
    case (cs_cat): return spr_superbell;
    case (cs_kuriboshoe): return spr_kuriboshoe;
    case (cs_baburushoe): return spr_baburushoe;
    case (cs_dossunshoe): return spr_dossunshoe;
    case (cs_jugemushoe): return spr_jugemushoe;
    case (cs_golden): return spr_goldshroom;
    case (cs_1up): return spr_1up;
    case (cs_3up): return spr_3upmoon;
    case (cs_poison): return spr_poison;
    case (cs_star): return spr_starman;
    case (cs_key): return spr_key;
    case (cs_trampoline): return spr_trampoline;
    case (cs_pswitch): return spr_pswitch;
    case (cs_gswitch): return spr_gswitch;
    case (cs_propellerblock): return spr_propellerblock;
    case (cs_beanstalk): return spr_beanstalk;
    default: return -1;
}
