///sprite_get_constant(sprite)

/*
**  Usage:
**      sprite_get_constant(sprite)
**
**  Given:
**      sprite      The sprite that represents what you want
**
**  Returns:
**      The constant that the sprite represents.
*/

switch (argument[0]) {

    case (spr_mushroom): return cs_big;
    case (spr_fireflower): return cs_fire;
    case (spr_iceflower): return cs_ice;
    case (spr_carrot): return cs_carrot;
    case (spr_leaf): return cs_leaf;
    case (spr_frogsuit): return cs_frog;
    case (spr_tanookisuit): return cs_tanooki;
    case (spr_hammerflower): return cs_hammer;
    case (spr_boomerangflower): return cs_boomerang;
    case (spr_superflower): return cs_super;
    case (spr_bombshroom): return cs_bomb;
    case (spr_blueshell): return cs_shell;
    case (spr_beeshroom): return cs_bee;
    case (spr_voltshroom): return cs_lightning;
    case (spr_penguinsuit): return cs_penguin;
    case (spr_propellershroom): return cs_propeller;
    case (spr_superbell): return cs_cat;
    case (spr_helmet): return cs_football;
    case (spr_egg): return cs_yoshi;
    case (spr_egg_r): return cs_yoshi_r;
    case (spr_egg_y): return cs_yoshi_y;
    case (spr_egg_b): return cs_yoshi_b;
    case (spr_egg_t): return cs_yoshi_t;
    case (spr_egg_p): return cs_yoshi_p;
    case (spr_kuriboshoe): return cs_kuriboshoe;
    case (spr_baburushoe): return cs_baburushoe;
    case (spr_dossunshoe): return cs_dossunshoe;
    case (spr_jugemushoe): return cs_jugemushoe;
    case (spr_pentaroshoe): return cs_pentaroshoe;
    case (spr_1up): return cs_1up;
    case (spr_3upmoon): return cs_3up;
    case (spr_starman): return cs_star;
    case (spr_pwing): return cs_pwing;
    case (spr_poison): return cs_poison;
    case (spr_rotten): return cs_rotten;
    case (spr_key): return cs_key;
    case (spr_pswitch): return cs_pswitch;
    case (spr_gswitch): return cs_gswitch;
    case (spr_trampoline): return cs_trampoline;
    case (spr_propellerblock): return cs_propellerblock;
    case (spr_beanstalk): return cs_beanstalk;
    case (spr_billygun): return cs_billy;
    case (spr_pipeypipe): return cs_pipey;
    default: return -1;
}
