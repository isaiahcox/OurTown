#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>


/*
 *   The South Gate - southgate.t 
     Author: Barry Eichelberger 
     Date: 11/10/2014
 *   Maintenance Log:
 */
    
SouthGate: OutdoorRoom 
    
        roomName = '<font color="#00ff00">South Gate</font>'
        desc = "<img src=\"southgate.jpg\" align=\"top\" width=\"200\" height=\"133\">The southern entrance/exit to Our Town. Beyond is just miles and miles of farmland..."
    
    north = SouthMainStreet
    south = SouthExit
;
