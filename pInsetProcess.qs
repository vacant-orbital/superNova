//version 1.0 -- potter 03Jan2023, revised 22Sep2023

function pInsetProcess(insetSpectrum, insetObj)
{   
    if ((insetObj.cuts !== null) && (insetObj.cuts !== undefined)) 
    {
    	pSetIntegrals(insetSpectrum, insetObj.cuts);
    }  
    if (insetObj.mathFunc !== null && insetObj.mathFunc !== undefined)
    {                      
    	insetObj["comp"] = insetObj.mathFunc(insetSpectrum, insetObj.mathFlag);
    	insetObj["intTot"] = insetObj.comp.intTot;
    }                	                	
    else
    {
    	insetObj.intTot = null;
    }    	              
    insetSpectrum.setProperty("title.visible", false);            
}
