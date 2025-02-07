/*  
20Jun2022 rgpotter
This script or similar needs to run before any processing or unpredictable results will be obtained.  It sets up basic properties and parameters for the FT, BC, integration, and resulting appearence of the spectrum
*/
function pSetupBc(aspectrum, aproc)
{	    
    pSetupSpecPropParams(aspectrum, aproc)	
    aproc.setParameter("BC[1].algorithm", "Splines"); //"PolyFit", "Whittaker" "Splines" here splines is cubic splines use     polyfit order=1 to match varian
    aproc.setParameter("BC[1].PolyOrder", 1);
    aproc.setParameter("BC[1].ExcludeCuts", true); 
    aproc.setParameter("BC[1].Apply", true);
    //aproc.setParameter("Apodization[0].Gauss.Value", 0.1);
    //aproc.setParameter("Apodization[0].Gauss.Apply", true);
    aproc.setParameter("Apodization[0].Exp.Value", 0.2);
    aproc.setParameter("Apodization[0].Exp.Apply", true);            	
}
