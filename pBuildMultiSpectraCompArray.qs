function pBuildMultiSpectraCompArray(spc, ar, acompdict) // pass the NMR_SPECTRUM object and the array of all int values for the spectrum 
	{
		ar1 = []; //clear the previous loop from the array	
		ar1.push(pGetLIMS(spc));		
		for(cmp in acompdict.comp)
		{		
			ar1.push(acompdict.comp[cmp]);									
		}
		
		if (acompdict.hasOwnProperty("sequen"))
		{
			//print("Found sequen!!");
			for (pmc in acompdict.sequen)
			{
				ar1.push(acompdict.sequen[pmc]); 
			}
		}
		if (acompdict.hasOwnProperty("wtComp"))
		{
			//print("Found sequen!!");
			for (pc in acompdict.wtComp)
			{
				ar1.push(acompdict.wtComp[pc]); 
			}
		}
		if (acompdict.hasOwnProperty("pegComp"))
		{
			//print("Found sequen!!");
			for (pec in acompdict.pegComp)
			{
				ar1.push(acompdict.pegComp[pec]); 
			}
		}								
		if (ar1[0] !== null) 
		{
			ar1[0] = ar1[0].toString().replace(/_/g, ""); // g is the flag for the regex /_/ it forces a global search
		}	
			                                          // the line above simply removes the underscore
		ar.push(ar1);		
	}
