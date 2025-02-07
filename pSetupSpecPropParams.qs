/*  
20Jun2022 rgpotter
This script or similar needs to run before any processing or unpredictable results will be obtained.  It sets up basic properties and parameters for the integration and resulting appearence of the spectrum
*/
function pSetupSpecPropParams(aspectrum, aproc)
{
    _f = aspectrum.getProperty("axes.font");
    _f.bold = true;
    aspectrum.setProperty("curve.color", "black");
    aspectrum.setProperty("curve.linewidth", 4);
    aspectrum.setProperty("title.visible", false); //changed from true 31Oct2022 RGP changed back and added line below 28Nov2022    
    //aspectrum.setProperty("title.format", "Data File Name: {parm, \x22Data File Name\x22}{br}"); // "\x22" codes for double quotes
    //aspectrum.setProperty("title.position", "Bottom"); // no way to do this yet through scripting
    aspectrum.setProperty("grid.showHorizontal", false);    
    aspectrum.setProperty("axes.horizontal.label", "Chemical Shift (ppm)");    
    aspectrum.setProperty("grid.showVertical", false);    
    aspectrum.setProperty("axes.vertical.visible", false);    
    aspectrum.setProperty("integrals.curve.margin", 96);    
    aspectrum.setProperty("integrals.curve.color", "#000000");  // hex for black    
    aspectrum.setProperty("integrals.label.margin", 1);  //changed from -2 rgp 26Jan2024   
    aspectrum.setProperty("integrals.label.color", "#000000");    
    aspectrum.setProperty("integrals.label.font", "MS Shell Dlg 2"); //MS Shell Dlg 2, 24  
    aproc.setParameter("PP.Sensitivity", aspectrum.realMax/10.0);//added 03Oct2023 RGP 
    aproc.setParameter("PP.Sensitivity_f1", aspectrum.realMax/10.0); //added 04Oct2023 RGP
    aspectrum.setProperty("axes.font", _f);	             
    //aspectrum.process(aproc); //17May2023 don't fourier transform yet move to pStudy after sufunc() is called       
    aspectrum.update();                	
}
