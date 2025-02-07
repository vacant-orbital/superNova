/*  
20Jun2022 rgpotter
This script or similar needs to run before any processing or unpredictable results will be obtained.  It sets up basic properties and parameters for the integration and resulting appearence of the spectrum
*/
function pSetupTMSbc(aspectrum, aproc)
{	    
    pSetupSpecPropParams(aspectrum, aproc)	
    aproc.setParameter("BC[1].algorithm", "Splines"); //"PolyFit", "Whittaker" "Splines" here splines default is cubic splines use     polyfit order=1 to match varian
    aproc.setParameter("BC[1].PolyOrder", 1);
    aproc.setParameter("BC[1].ExcludeCuts", true); 
    aproc.setParameter("BC[1].Apply", true);
    //aproc.setParameter("Apodization[1].Gauss.Value", 0.1); // 17May2023  changed from "Apodization[0].Gauss.Value"
    //aproc.setParameter("Apodization[1].Gauss.Apply", true); //  17May2023  changed from "Apodization[0].Gauss.Apply" gaussian apodization now working!!   
    aproc.setParameter("Apodization[1].Exp.Apply", true);
    aproc.setParameter("Apodization[1].Exp.Value", 0.2);           	
}
