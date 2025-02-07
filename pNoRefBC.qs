function pNoRefBC(aspectrum, aStat, ablinds, aBlindRegs)
{
    if (aBlindRegs !==null && aBlindRegs !== undefined)
    {
        for (var rj = 0; rj < ablinds.length; rj++) 
        {    
            aBlindRegs[rj] = new BlindRegion(ablinds[rj][0], ablinds[rj][1]); 
        } 
    }                         
    

	//  replaced the lines below with the if statement above 22Jan2025
	
//    for (var rj = 0; rj < ablinds.length; rj++) 
//    {    
//        aBlindRegs[rj] = new BlindRegion(ablinds[rj][0], ablinds[rj][1]); 
//    }                          
}            

