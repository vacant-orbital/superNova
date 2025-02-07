function pAppendComp(acomposition, anallcomps)
{
    if (acomposition !== undefined)
    {  
    	if (acomposition.comp !== null)
    	{
        	for (var acomp in acomposition.comp)
        	{        
            	if (acomposition.comp.hasOwnProperty(acomp))
            	{
                	anallcomps[anallcomps.length - 1][anallcomps[anallcomps.length - 1].length - 1] = acomposition.comp[acomp];
            	}
        	}
    	}        
	}
}    
    
    
