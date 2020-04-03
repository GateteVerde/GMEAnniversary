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
    case (cs_football): return spr_helmet;
    case (cs_yoshi): return spr_egg;
    case (cs_yoshi_r): return spr_egg_r;
    case (cs_yoshi_y): return spr_egg_y;
    case (cs_yoshi_b): return spr_egg_b;
    case (cs_yoshi_t): return spr_egg_t;
    case (cs_yoshi_p): return spr_egg_p;
    case (cs_kuriboshoe): return spr_kuriboshoe;
    case (cs_baburushoe): return spr_baburushoe;
    case (cs_dossunshoe): return spr_dossunshoe;
    case (cs_jugemushoe): return spr_jugemushoe;
    case (cs_pentaroshoe): return spr_pentaroshoe;
    case (cs_golden): return spr_goldshroom;
    case (cs_1up): return spr_1up;
    case (cs_3up): return spr_3upmoon;
    case (cs_star): return spr_starman;
    case (cs_pwing): return spr_pwing;
    case (cs_poison): return spr_poison;
    case (cs_rotten): return spr_rotten;
    case (cs_key): return spr_key;
    case (cs_pswitch): return spr_pswitch;
    case (cs_gswitch): return spr_gswitch;
    case (cs_trampoline): return spr_trampoline;
    case (cs_propellerblock): return spr_propellerblock;
    case (cs_beanstalk): return spr_beanstalk;
    case (cs_billy): return spr_billygun;
    case (cs_pipey): return spr_pipeypipe;
    case (cs_area_y): return spr_mushroom;
    case (cs_area_g): return spr_leaf;
    case (cs_area_r): return spr_fireflower;
    case (cs_area_b): return spr_iceflower;
    default: return -1;
}
