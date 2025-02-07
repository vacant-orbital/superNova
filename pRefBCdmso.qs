function pRefBCdmso(aspectrum, ablinds, aBlindRegs)
{  //references dmso and formally sets the blind regions within MestReNova
    aspectrum.reference(1, 2.50, 2.50, true, 1.2);	//number ndim, number old shift, number new shift, boolean autotune, autotune tolerance
    
    if (aBlindRegs !==null && aBlindRegs !== undefined)
    {
        for (var rj = 0; rj < ablinds.length; rj++) 
        {    
            aBlindRegs[rj] = new BlindRegion(ablinds[rj][0], ablinds[rj][1]); 
        } 
    }                         
    
    //Replaced the lines below with the if statement above 22Jan2025    
    
//    for (var rj = 0; rj < ablinds.length; rj++) 
//    {    
//        aBlindRegs[rj] = new BlindRegion(ablinds[rj][0], ablinds[rj][1]); 
//    }                           
}            

