function example3Math(aSpectrum, aMathFlag)  //removed parameters 2 and 3 (aP, anInts) 
{                                             //redefined intTot and intTotal to accommodate 1.0 refactoring rgp20Oct2023
    var mathVals = {};
    var comp = {}; 
    var wtComp = {};
    
    var bpa = aSpectrum.integrals().at(5).integralValue()/4;
    var ald = (aSpectrum.integrals().at(7).integralValue() - (6 * bpa))/18;   
    
    var intTot = aSpectrum.integrals().at(0).integralValue() + aSpectrum.integrals().at(1).integralValue() + aSpectrum.integrals().at(2).integralValue() + aSpectrum.integrals().at(3).integralValue() + aSpectrum.integrals().at(4).integralValue() + aSpectrum.integrals().at(5).integralValue() + aSpectrum.integrals().at(6).integralValue();
    
/*    if ((aSpectrum.integrals().at(6).integralValue() > aSpectrum.integrals().at(4).integralValue()/15) && (aMathFlag !== true))
    {
        var str = aSpectrum.integrals().at(6).integralValue()/4;
    }
    else
    {
        var str = 0.0;
    }
*/    
    intTotal = bpa + ald;
       
    comp["bisphenol A"] = (100*(bpa/intTotal)).toFixed(2);// molecular weight 126.110
    comp["3,5-Di-tert-butylsalicylaldehyde"] = (100*(ald/intTotal)).toFixed(2);//molecular weight 60.052
/*    if (str !== 0)
    {
        comp["str"] = (100*(str/intTotal)).toFixed(2);
        var mwtstr = comp["str"] * 607.02;
    }
    else var mwtstr = 0.0;
*/
    
    var mwbpa = comp["bisphenol A"] * 228.29;
    var mwald = comp["3,5-Di-tert-butylsalicylaldehyde"] * 234.33;
    var totMoleWt = mwbpa + mwald;
    
    wtComp["bisphenol A(wtPCT)"] = 100 *(mwbpa/totMoleWt);
    wtComp["3,5-Di-tert-butylsalicylaldehyde(wtPCT)"] = 100 * (mwald/totMoleWt);        
/*    if (str !== 0)
    {
        wtComp["str(wtPCT)"] = 100 * (mwtstr/totMoleWt);    
    }            
 */       
    mathVals["comp"] = comp;
    mathVals["intTot"] = intTot //pGetIntTot(aSpectrum);
    mathVals["wtComp"] = wtComp;
    mathVals["intNormValue"] = intTot/100;    
    
//    for (var keY in mathVals["comp"])
//    {
//         if (mathVals.hasOwnProperty(keY)){
//             print("keY: " + keY + "   mathVals[keY]: " + mathVals[keY]);
//         }
//    }          
    return mathVals;
}

