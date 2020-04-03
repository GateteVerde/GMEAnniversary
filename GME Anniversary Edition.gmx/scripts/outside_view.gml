///outside_view()

/*
**  Usage:
**      outside_view()
**
**  Purpose:
**      Checks if a object is outside the view
*/

if (x < view_xview[0]-40)
|| (y < view_yview[0]-32)
|| (x > view_xview[0]+view_wview[0]+40)
|| (y > view_yview[0]+view_hview[0]+32)
    return true;
else
    return false;
