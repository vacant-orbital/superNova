
function pAddPbox(apage, atxtBx, apbox)
{
    apage.addItem(atxtBx);  //applied Text() to draw.text() 24May2022    											
    apage.itemsByName("Text")[0].left = apage.left; 
    apage.itemsByName("Text")[0].top = apage.top;    
    if (apbox.height !== null && apbox.height !== undefined)
    {
       apage.itemsByName("Text")[0].height = apbox.height;
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