///redcoin_set(numb,x,y);

/*
**  Usage:
**      redcoin_set(numb,x,y);
**
**  Function:
**      Places a red coin with the given id (numb), at the given position (x,y).
*/

//Create a red coin at the given x (Argument 1) position
if (argument[1] != 0)
    coin_x[argument[0]] = argument[1];
else
    coin_x[argument[0]] = xstart;
    
//Create a red coin at the given y (Argument 2) position
if (argument[2] != 0)
    coin_y[argument[0]] = argument[2];
else
    coin_y[argument[0]] = ystart;
