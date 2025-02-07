function pRefBCdmf(aspectrum, ablinds, aBlindRegs)
{// references the formyl signal of DMF to 8.03. Sets the blind regions within MesReNova
    aspectrum.reference(1, 8.03, 8.03, true, 1.2);	//number ndim, number old shift, number new shift, boolean autotune, autotune tolerance
    
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

