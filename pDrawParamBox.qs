function pDrawParamBox(apage, aparams)
{
    var txtBx = Text(draw.text("<font style=\"font-size: 8pt; font-family: Arial\">" + aparams +"<\font>", true));
    apage.addItem(txtBx);  //applied Text() to draw.text() 24May2022    											
    apage.itemsByName("Text")[0].left = apage.left; 
    apage.itemsByName("Text")[0].top = apage.top;    
    if (aheight !== null && aheight !== undefined)
    {
       apage.itemsByName("Text")[0].height = aheight;
    }
          	
    //apage.itemsByName("NMR Spectrum")[0].setChildType(apage.itemsByName("Text")[0], "Canvas");    
    
    
    if (apage.itemsByName("Text")[0].parentUuid.length > 0) 
    {    
        apage.itemsByName("NMR Spectrum")[0].setChildType(apage.itemsByName("Text")[0], "Canvas");    
    } 
    else
    {    
        apage.itemsByName("NMR Spectrum")[0].addChild(apage.itemsByName("Text")[0]);    
        apage.itemsByName("NMR Spectrum")[0].setChildType(apage.itemsByName("Text")[0], "Canvas");        
    }                    
	mainWindow.activeWindow().update(); //   COMMENTED OUT 07MAR2022;  Reactivated 25May2022 this is necessary for correct text placement		    
}