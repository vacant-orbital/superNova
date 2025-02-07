/*  
20Jun2022 rgpotter
This module collects parameters from a varian or Bruker spectrum and builds an old-school html table to emulate varian format.
*/
function pParameterBox(aspectrum, aproc, acomposition, apbox)
{
    //Build a parameter box as a html table
    var params ="<html><body><table border=\"0\" frame=\"border\">";
    params += "<tr><td>Comment: </td><td>"// + str2 + "</td></tr>";
    for (j=0; j < apbox.comment.length; j++)
    {    
        params += "<tr><td></td><td>" + apbox.comment[j] + "</td></tr>";
    }
	if (/Varian/.exec(aspectrum.getParam("Origin")))
    {            
       params += "<tr><td>Spectrometer: </td><td>" + aspectrum.getParam("Origin") + " " + Math.round(aspectrum.getParam("Spectrometer Frequency")) + " MHz VNMRS" + "</td></tr>";
    }
    else
    {                
    	params += "<tr><td>Spectrometer: </td><td>" + aspectrum.getParam("Instrument");
    }
    if (/Bruker/.exec(aspectrum.getParam("Origin")))
    {
        params += "<tr><td>Probe: </td><td>" + aspectrum.getParam("Probe");
    }
    if (/Bruker/.exec(aspectrum.getParam("Origin")))
    {
        params += "<tr><td>Pulse Program: </td><td>" + aspectrum.getParam("Pulse Sequence");
    }            
    params += "<tr><td>Solvent: </td><td>" + aspectrum.getParam("Solvent") + "</td></tr>";
    params += "<tr><td>Temperature: </td><td>" + aspectrum.getParam("Temperature") + " K" + "</td></tr>";
    params += "<tr><td>Reveiver Gain: </td><td>" + aspectrum.getParam("Receiver Gain") + "</td></tr>";
    params += "<tr><td>Number of Scans: </td><td>" + aspectrum.getParam("Number of Scans") + "</td></tr>";
    if (pScrape(apbox.acqusRegex, apbox.acqus) !== null)
    {
    	params += "<tr><td>DS: </td><td>" + pScrape(apbox.acqusRegex, apbox.acqus) + "</td></tr>";    
    } 
    else
    {
    	params += "<tr><td>DS: </td><td>" + "not found </td></tr>";    
    }    	   	
    params += "<tr><td>Relaxation Delay: </td><td>" + aspectrum.getParam("Relaxation Delay") + "</td></tr>";
    params += "<tr><td>Acq. Time (sec): </td><td>" + pRound(aspectrum.getParam("Acquisition Time"), 3) + "</td></tr>";
    params += "<tr><td>Acquisition Date: </td><td>" + aspectrum.getParam("Acquisition Date") + "</td></tr>";
    if ((aspectrum.getParam("Pulse Sequence") == "zg60") && (pRound(aspectrum.getParam("Pulse Width"), 2) == 12.00)) 
    {
    	//params += "<tr><td>Pulse Width</td><td>" + (0.6 * pRound(aspectrum.getParam("Pulse Width"), 2)) + "</td></tr>";
       params += "<tr><td>Pulse Width</td><td>" + "8 usec" + "</td></tr>"; 
    }
    else
    {
    	params += "<tr><td>Pulse Width</td><td>" + (pRound(aspectrum.getParam("Pulse Width"), 2)) + "</td></tr>";  
    } 
    params += "<tr><td>Spectrometer Frequency</td><td>" + pRound(aspectrum.getParam("Spectrometer Frequency"), 2) + "</td></tr>";
    
    params += "<tr><td>Spectral Width</td><td>" + pRound(aspectrum.getParam("Spectral Width"), 2) + "</td></tr>";
    params += "<tr><td>Nucleus</td><td>" + aspectrum.getParam("Nucleus") + "</td></tr>";            
    if (aproc.getParameter("Apodization[1].Gauss.Apply"))
    {
    	params += "<tr><td>WDW: </td><td>" + "Gauss </td></tr>";
    	params += "<tr><td>lb: </td><td>" + aproc.getParameter("Apodization[1].Gauss.Value") + "</td></tr>";
    } 
    if (aproc.getParameter("Apodization[1].Exp.Apply"))
    {
    	params += "<tr><td>WDW: </td><td>" + "Exp </td></tr>";
    	params += "<tr><td>lb: </td><td>" + aproc.getParameter("Apodization[1].Exp.Value") + "</td></tr>";
    }    	            
    params += "<tr><td></td><td>" + "</td></tr>";
    params += "<tr><td>Processed " + apbox.today + " using MestReNova </td></tr>";       
    params += "<tr><td>" + apbox.macroname + " macro (unvalidated)</td></tr>";
    params += "<tr><td></td><td>" + "</td></tr>";    
    
    if (acomposition !== null && acomposition !== undefined)
    {
        
        if (acomposition.hasOwnProperty("pegComp"))
        {
            params += "<tr><td>Mol Composition (values in parentheses include PEG)</td><td>";
            for (var acomp in acomposition.comp)
            {
                //params += "<tr><td>" + acomp + "</td><td>" + acomposition[acomp] + " (" + acomposition[[acomp[2]]] +") </td></tr>";
                if (acomposition.comp.hasOwnProperty(acomp))
                {            
                    params += "<tr><td>" + acomp + "</td><td>" + acomposition.comp[acomp] + " (" + acomposition.pegComp[acomp] + ") </td></tr>";
                }
            }
        }
        else if (acomposition.hasOwnProperty("wtComp"))
        {
            params += "<tr><td>Mol Composition (wt pct values in parentheses)</td><td>";
            for (var acomp in acomposition.comp)
            {
                //params += "<tr><td>" + acomp + "</td><td>" + acomposition[acomp] + " (" + acomposition[[acomp[2]]] +") </td></tr>";
                if (acomposition.comp.hasOwnProperty(acomp))
                {   
                    var pComp = acomp + "(wtPCT)";         
                    params += "<tr><td>" + acomp + "</td><td>" + acomposition.comp[acomp] + " (" + acomposition.wtComp[pComp].toFixed(2) + ") </td></tr>";
                }
            }
        }            
        else
        {
            if (acomposition.comp !== null && acomposition.comp !== undefined)
            {
                params += "<tr><td>Mol Composition</td><td>";
                for (var acomp in acomposition.comp)
                {                
                    if (acomposition.comp.hasOwnProperty(acomp))
                    {            
                        params += "<tr><td>" + acomp + "</td><td>" + acomposition.comp[acomp] + "</td></tr>";
                    }
                }            
            }
        }
        if (acomposition.hasOwnProperty("sequen") && acomposition.sequen !== null && acomposition.sequen !== undefined)
        {
            params += "<tr><td>Sequence Distribution: As % of G Present</td><td>";
            for (var aseq in acomposition.sequen)
            {
                params += "<tr><td>" + aseq + "</td><td>" + acomposition.sequen[aseq] + "</td></tr>";
            }
        }
                
    }  
    if(apbox.stats.getTMSlw)
    {    
        params += "<tr><td>tms linewidth: </td><td>" + apbox.stats.tmsLineWidth.toFixed(2) + ' Hz'+ "</td></tr>"; 
        //changed above from round(astat.tmsLineWidth, 2) in order to always include two decimals
    }                  			
    var txtBx = Text(draw.text("<font style=\"font-size: 8pt; font-family: Arial\">" + params +"<\font>", true));
    return txtBx;    	
}