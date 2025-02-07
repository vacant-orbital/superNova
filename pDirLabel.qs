function pDirLabel(apage, aspectrum, adirlabel)// formrely last 4 params aheight, awidth, aHomeDir, aPos)
{
    //Build a parameter box as a html table
    var usbFile = aspectrum.getParam("Data File Name"); //this is the path of the file from where you opened it from (most likely usb or local file path)    
    if (usbFile == undefined)
    {
        usbFile = aspectrum.getParam("Data Path");
    }
    var myRegexp1 = /auto_.*/; //just use part of the usb path after /auto_
    var myRegexp2 = /s_.*/; //just use part of the usb path after /s_        
    var myRegexp3 = /\/AC_\d{4}_\w+\/\d{1,3}\/.*/;        
    var match1 = myRegexp1.exec(usbFile);    
    if (myRegexp1.exec(usbFile))
    {
        var hostDir = adirlabel.homeDir + myRegexp1.exec(usbFile);
    }         
    else if (myRegexp2.exec(usbFile))
    {    
        var hostDir = adirlabel.homeDir + myRegexp2.exec(usbFile);
    }
    else if (myRegexp3.exec(usbFile))
    {    
        var hostDir = adirlabel.homeDir + myRegexp3.exec(usbFile);
    } 
    else if (usbFile.match(myRegexp3))
    {    
        var hostDir = adirlabel.homeDir + usbFile.match(myRegexp3);
    }        
    else
    {     
    	var hostDir = adirlabel.homeDir + pConvertUnixPathToWindows(pFilePathChopper(usbFile));
    }    	                
    var params ="<html><body><table border=\"0\" frame=\"border\">";    
    params += "<tr><td>Original File Location: </td><td>" + hostDir + "</td></tr>";    			
    var txtBx = Text(draw.text("<font style=\"font-size: 8pt; font-family: Arial\">" + params +"<\font>", true));
    apage.addItem(txtBx);  //applied Text() to draw.text() 24May2022    
    if (apage.itemsByName("Text")[2] !== undefined)
    {
        textIndex = 2;    
    }
    else
    {
        textIndex = 1;
    }         											    
    if (adirlabel.height !== null && adirlabel.height !== undefined)
    {    
       apage.itemsByName("Text")[textIndex].height = adirlabel.height;    
    }                         
    if (apage.itemsByName("Text")[textIndex].parentUuid.length > 0) 
    {                   
        apage.itemsByName("NMR Spectrum")[0].setChildType(apage.itemsByName("Text")[textIndex], "Canvas"); 
    }         
    else
    {    
        apage.itemsByName("NMR Spectrum")[0].addChild(apage.itemsByName("Text")[textIndex]);
        apage.itemsByName("NMR Spectrum")[0].setChildType(apage.itemsByName("Text")[textIndex], "Canvas");
    }                 
    apage.itemsByName("Text")[textIndex].translate(adirlabel["x"], adirlabel["y"]);                       
}