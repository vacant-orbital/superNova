function pRefBCcdcl3(aspectrum, ablinds, aBlindRegs)
{   // reference CDCl3 and set formally set the blind regions in MestReNova 
    aspectrum.reference(1, 7.2, 7.258, true, 1.2);	//number ndim, number old shift, number new shift, boolean autotune, autotune tolerance
    
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

