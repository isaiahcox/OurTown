#charset "us-ascii"
#include <adv3.h>
#include <en_us.h>

/* "Endora's Mansion", located... "
Created by Laurie Starr
Created on September 18, 2014 
    maintenance log
github test October 6, 2014
added Cellar Door November 4, 2014
added to the Pull verb in re the Summoning Rope and the Open verb in re the Cellar Door
added Book of Shadows to Merrick's personal belongings December 16, 2014
04/08/2015 BE made minor change to summoning message.

*/

EndorasMansion: Room
    name = '<font color="#880000">Endora\'s Mansion</font>'
    vocabWords = 'mansion'    
    desc = "<p>An expansive/decrepit Victorian Era Mansion. Void of any paint and surrounded by brambles and briars.. Inside the mansion the sun bounces dusty rays off ornate, antique furnishings. To the north you can barely make out the shape of a door.</p>"
    
    east = WestBroadway
    north = CellarDoor
;

+SummoningRope: Thing
    name = 'Summoning Rope' 
    vocabWords = 'rope/Rope' 
    location = EndorasMansion
    desc = "<p>An ornate, braided, silk rope with a gold tassle hangs from seemingly no where just inside the door.</p>"
    inRoomDesc = "<p>An ornate, braided, silk rope with a gold tassle hangs from seemingly no where just inside the door.</p>"
    
    dobjFor(Take) 
    { 
        action() 
        { 
            "The Summoning Rope is not to be removed from Endora's Mansion!" ;
        } 
   } 
  
    
    dobjFor(Pull)
    {
        action()
        {
            // Endora has not been discovered 
            if (!Endora.discovered && !Merrick.discovered)
            {           
                Endora.discover();          
                "<p>From deep inside the mansion you hear the unpleasant cackling of an angry witch. You have summoned Endora, the Wicked Witch of West Broadway. Look upon her at your own peril.</p>"; 
            }
            // if Endora has been summoned and is still in the mansion and Merrick has been set loose Endora "dies" (sent to the abyss)
            else if (!Endora.discovered && Merrick.discovered && Endora.location != theAbyss)
            {
                Endora.discover();                
                "<p>From deep inside the mansion you hear the unpleasant cackling of an angry witch. You have summoned Endora, the Wicked Witch of West Broadway. Look upon her at your own peril.</p>"; 
           
                "<p>\"Merrick! Who released you?\" states a very suprised Endora.</p>";          
            }                   
            // if the rope has been pulled previously Endora has already been summoned
            else if (Endora.discovered && Endora.location != theAbyss)       
            {
                "<p>The Witch has already been summoned.</p>" ;
            }
        
            // Endora has already been summoned and killed
            else if (Endora.location == theAbyss)
            {
                "<p>Ding Dong the Witch is Dead, the wicked witch, the mean old witch...</p>";
            }
        }
        
    }
;


/* The Cellar Door is only to release Endora's prisoner, entrance to the cellar is not permitted. */

+ CellarDoor: LockableWithKey, Door  
	'Cellar Door'
        'Cellar Door'
        "<p>The door, constructed of weathered planking, has centered on it an aged locking mechanism. From beyond the door you hear the tortured cries of a hopeless prisoner.</p>"
    keyList = [skeletonKey]
    
/* Opening of the cellar door results in the release of Endora's prisoner and can only be done with the possession of the skeleton key that was dropped on West Broadway. */
    
    dobjFor(Open)
    {
        action()
        {
            if (!Merrick.discovered)
            {
                Merrick.discover();   
                "<p>You have released Endora's long time prisoner, Merrick. The only soul capable of destroying Endora!</p>";                "<p>He hands you a book. \"Take this book to the Scriptorium and don't let Endora get it away from you.\"</p>";
                BookofShadows.location = EndorasMansion;
                if (Endora.location == EndorasMansion && Endora.discovered)
                { 
                    "<p>\"Why Merrick, what a pleasant suprise.\" states a very nervous Endora.</p>";              
                }  
                else if (Endora.location == EndorasMansion && !Endora.discovered)
                {
                    "<p>\"Where is she?\" states a very angry Merrick.</p>";
                }
            } 
            else 
            {
                "<p>Endora's prisoner has already been released.</p>";
            }
        }
    } 
         
   

 ;



 