//Fit TMS to generalized Lorentzian and get specs for the middle peak (i.e not low level contaminants, 29Si, or 13C
//satelites.  04Oct2023 RGP found mnova bug which prevents)
function pTmsRefStats(aspec)
{
    var tmpReg = new SpectrumRegion(-0.15, 0.15);
    var tmpPeaks = new Peaks(aspec, tmpReg);
    var tmpWidth = 0.0;    
    const tmsFit = new  FitRegion(-0.15, 0.15, aspec);          
    var tmpPeak = aspec.peaks().byId(tmsFit.peaks[0]);                                         
    for (var trsi=0; trsi < tmsFit.peaks.length; trsi++)  //maybe length minus one
    {              
        if (aspec.peaks().byId(tmsFit.peaks[trsi]).intensity >= tmpPeak.intensity)// changed from intensity       
        {            
            tmpWidth = aspec.peaks().byId(tmsFit.peaks[trsi]).width() * aspec.getParam("Spectrometer Frequency");
            tmpPeak = aspec.peaks().byId(tmsFit.peaks[trsi]);   //added this line 02Oct2023         
        }
    }               	
    return tmpWidth;    
}         
        
        
        
/*        
        
        
        
        
        if(tmpWidth > 0.0)
        {
        	return tmpWidth;
        }
        else
        {
        	tmsFit = new  FitRegion(0.15, -0.15, aspec);
        	tmpPeak = aspec.peaks().byId(tmsFit.peaks[0]);
        	for (var trsi=0; trsi < tmsFit.peaks.length; trsi++)  //maybe length minus one
        	{              
            	if (aspec.peaks().byId(tmsFit.peaks[trsi]).intensity >= tmpPeak.intensity)// changed from intensity       
            	{            
                	tmpWidth = aspec.peaks().byId(tmsFit.peaks[trsi]).width() * aspec.getParam("Spectrometer Frequency");
                	tmpPeak = aspec.peaks().byId(tmsFit.peaks[trsi]);   //added this line 02Oct2023         
            	}
        	}
        }                        	
        print("tmpWidth: " + tmpWidth);          	            
        return tmpWidth;
        
    }        

       ----  Old version  ----
tmsWidth = spec.peaks().byId(tmsFit.peaks[1]).width() * spec.getParam("Spectrometer Frequency")  
then mult by 500 to get Hz for a 500 MHz spectrometer--this was abandoned for the strategy above which toggles throug to find the major 12C29Si12C peak 
*/
