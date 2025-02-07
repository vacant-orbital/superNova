function pNormInts(aspectrum, asetints)
{
    if (asetints.normInt !== null)
    {            
		aspectrum.integrals().normValue = aspectrum.integrals().at(asetints.normInt).integralValue()/asetints.value;  
		asetints["pnormintvalue"] = aspectrum.integrals().at(asetints.normInt).integralValue()/asetints.value;  	    
    }
       
    else 
    {
        if (asetints.intTot !== null)
        {        
        	aspectrum.integrals().normValue = asetints.intTot/100.00;//added 01Dec2022                  
        }
        else
        {        
			aspectrum.integrals().normValue = pGetIntTot(aspectrum)/100.00;                   
			asetints["pnormintvalue"] = pGetIntTot(aspectrum)/100.00; //or change pStudy where  
		 }         // this value is used (iff statement switching to this.spec.integrals.normValue 
    }		 
}      