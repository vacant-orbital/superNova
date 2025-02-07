/*  
06Jan2023 rgpotter
This module collects parameters from a varian spectrum and builds an old-school html table to emulate varian format.
*/
function pInsetSequenBox(apage, acomposition, aheight, awidth)
{
    //Build a parameter box as a html table
    var params ="<html><body><table border=\"0\" frame=\"border\">";
    params += "<tr><td>Sequen Stats</td><td>";        	
    
    if (acomposition !== undefined)
    {            	
    	if (acomposition.comp !== null)
    	{
        	for (var acomp in acomposition.comp)
        	{        
            	if (acomposition.comp.hasOwnProperty(acomp))
            	{
               	 params += "<tr><td>" + acomp + "</td><td>" + acomposition.comp[acomp] + "</td></tr>";
            	}
        	}
    	}
    }
    			
    var txtBx = Text(draw.text("<font style=\"font-size: 8pt; font-family: Arial\">" + params +"<\font>", true));    			
    apage.addItem(txtBx);  //applied Text() to draw.text() 24May2022    
    										
    apage.itemsByName("Text")[1].left = apage.left; 
    apage.itemsByName("Text")[1].bottom = apage.bottom;
    apage.itemsByName("Text")[1].translate(0, 150);    
    if (aheight !== null && aheight !== undefined)
    {
       apage.itemsByName("Text")[1].height = aheight;
    }
    if (awidth !== null && awidth !== undefined)
    {
       apage.itemsByName("Text")[1].width = awidth;
    }       	
            
    if (apage.itemsByName("Text")[1].parentUuid.length > 0) 
    {    
        apage.itemsByName("NMR Spectrum")[0].setChildType(apage.itemsByName("Text")[1], "Canvas");    
    } 
    else
    {    
        apage.itemsByName("NMR Spectrum")[0].addChild(apage.itemsByName("Text")[1]);    
        apage.itemsByName("NMR Spectrum")[0].setChildType(apage.itemsByName("Text")[1], "Canvas");        
    }  
    
	mainWindow.activeWindow().update(); //   COMMENTED OUT 07MAR2022;  Reactivated 25May2022 this is necessary for correct text placement		
}