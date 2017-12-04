///scr_mario_spin2()

/*
**  Usage:
**      scr_mario_spin2()
**
**  Purpose:
**      Calls the appropiate alt. spinning sprite for Mario.
*/

switch (global.powerup) {

    case (cs_propeller): {
    
        if (yspeed > 0)
            return spr_mario_propeller_spin2;
        else
            return spr_mario_propeller_spin3;
    }
}
