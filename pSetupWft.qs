/*  
20Jun2022 rgpotter
This script or similar needs to run before any processing or unpredictable results will be obtained.  It sets up basic properties and parameters for the integration and resulting appearence of the spectrum
*/
function pSetupWft(aspectrum, aproc)
{
    pSetupSpecPropParams(aspectrum, aproc);
    //aspectrum.setProperty("axes.margin.mm", 17.0);	
    //print(aspectrum.getProperty("axes.margin.mm"));
    aproc.setParameter("BC[1].algorithm", "Bernstein"); //"PolyFit", "Whittaker" "Splines" here splines is cubic splines use     polyfit order=1 to match varian
    aproc.setParameter("BC[1].PolyOrder", 3);
    //aproc.setParameter("BC[1].ExcludeCuts", true); 
    aproc.setParameter("BC[1].Apply", false);
    //aproc.setParameter("Apodization[1].Gauss.Value", 0.1);
    //aproc.setParameter("Apodization[1].Gauss.Apply", true);
    aproc.setParameter("Apodization[1].Exp.Value", 0.2);
    aproc.setParameter("Apodization[1].Exp.Apply", true);  //Need this indexed to 1 in order to get correct application of window function    
    //aspectrum.process(aproc);     //THIS HAS BEEN MOVED OUT TO Pstudy.  DONT CALL HERE!!!                       	
}
