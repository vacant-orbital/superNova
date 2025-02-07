function pBuildMultiSpectraIntArray(spc, ai, amathdict) // pass the NMR_SPECTRUM object, a list of integrals and the array of all int values for the spectrum 
	{
		ar1 = []; //clear the previous loop from the array
		ar1.push(pGetLIMS(spc));
		/*var dfn = spc.getParam("Data File Name");				
		var myRegexp4 = /\_\d{5,7}/;   // 16May2023  changed from /\_\d{5,7}\_/
		var myRegexp5 = /\/\d{7}\//;
		var match4 = myRegexp4.exec(dfn);	
		if (match4 == null || match4 == undefined)
		{
		    match4 = myRegexp5.exec(dfn);
		}	
		ar1.push(match4);
		*/
		//for(k=0; k<ins.count; k++)
		for(k=0; k<spc.integrals().count; k++)
		{		
			ar1.push(spc.integrals().at(k).integralValue(amathdict["intNormValue"]));											
		}
		if (ar1[0] !== null) 
		{
			ar1[0] = ar1[0].toString().replace(/_/g, ""); // g is the flag for the regex /_/ it forces a global search
		}		                                          // the line above simply removes the underscore
		ai.push(ar1);		
	}		
