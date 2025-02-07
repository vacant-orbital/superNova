/*  
20Jun2022 rgpotter -- integration parameter setup for PEG samples.  The PEG signal is normalized to a large number so that the endgroup signals > 0. 
This script or similar needs to run before any processing or unpredictable results will be obtained.  It sets up basic properties  and parameters for the integration and resulting appearence of the spectrum by calling pSetupSpecPropParams, then is sets a reasonable normalization value (100) and range for the biosurgery related samples.
*/
function pbsSetupSpecPropParams(aspectrum, aproc)
{
    pSetupSpecPropParams(aspectrum, aproc);
    aproc.setParameter("Norm.Apply", true);    
    aproc.setParameter("Norm.Method", "PeakRange");    
    aproc.setParameter("Norm.HorzRange", [3.9,3.25]);    
    aproc.setParameter("Norm.Value", 10000);		        
    aspectrum.process(aproc);    	
}
