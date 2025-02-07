function pRefACN(aspectrum, ablinds, aBlindRegs)
{
    aspectrum.reference(1, 1.97, 1.96, true, 1.1);	//number ndim, number old shift, number new shift, boolean autotune, autotune tolerance previously 1, 1.97, 19.6, 2.1
    if (aBlindRegs !==null && aBlindRegs !== undefined)
    {
        for (var rj = 0; rj < ablinds.length; rj++) 
        {    
            aBlindRegs[rj] = new BlindRegion(ablinds[rj][0], ablinds[rj][1]); 
        } 
    }                         
}            

