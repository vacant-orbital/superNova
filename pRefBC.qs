function pRefBC(aspectrum, ablinds, aBlindRegs)
{
    aspectrum.reference(1, 0.0, 0.0, true, 1.2);	//number ndim, number old shift, number new shift, boolean autotune, autotune tolerance  changed 2nd parameter from -0.5 07Mar20224 RGP
    
    if (aBlindRegs !==null && aBlindRegs !== undefined)
    {
        for (var rj = 0; rj < ablinds.length; rj++) 
        {    
            aBlindRegs[rj] = new BlindRegion(ablinds[rj][0], ablinds[rj][1]); 
        } 
    }                         
        
    
    //  Replaced the lines below with the if statement above 22Jan2025
    
//    for (var rj = 0; rj < ablinds.length; rj++) 
//    {    
//        aBlindRegs[rj] = new BlindRegion(ablinds[rj][0], ablinds[rj][1]); 
//    }                          
}            

