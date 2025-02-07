function pWft()
{   //potter Dec2023 this should emulate wft function in vnmrj or ENPR
    pWftObj = new Pstudy();
    pWftObj.suFunc = pSetupWft;    
    pWftObj.pbox.macroname = "pWft";        
    pWftObj.pbox.stats.getTMSlw = false;         
    pWftObj.pbox.drawpbox = false;             
    pWftObj.yViewMin = -0.08; //changed from -0.2 to get integrals into view
    pWftObj.yViewMax = 2.4; 
    pWftObj.dirLabel.apply = false;                       
    pWftObj.processSelectedSpectra();
    pWftObj.dirLabel.apply = true;
    pWftObj.pbox.drawpbox = true;
    pWftObj.pbox.stats.getTMSlw = true;
}