function example1Math(aSpectrum, aMathFlag)  //removed parameters 2 and 3 (aP, anInts) 
{           //redefined intTot and intTotal to accommodate 1.0 refactoring rgp20Oct2023
    var mathVals = {};
    var comp = {}; 
    var wtComp = {};
    
    var fa = aSpectrum.integrals().at(3).integralValue()/3;
    var aa = aSpectrum.integrals().at(4).integralValue()/3;   
    
    var intTot = aSpectrum.integrals().at(0).integralValue() + aSpectrum.integrals().at(1).integralValue() + aSpectrum.integrals().at(2).integralValue() + aSpectrum.integrals().at(3).integralValue() + aSpectrum.integrals().at(4).integralValue() + aSpectrum.integrals().at(5).integralValue() + aSpectrum.integrals().at(6).integralValue();
            
    intTotal = fa + aa;
       
    comp["3-methyl-furoic acid"] = (100*(fa/intTotal)).toFixed(2);// molecular weight 126.110
    comp["acetic acid"] = (100*(aa/intTotal)).toFixed(2);//molecular weight 60.052    
    
    var mwtfa = comp["3-methyl-furoic acid"] * 126.110;
    var mwtaa = comp["acetic acid"] * 60.052;
    var totMoleWt = mwtfa + mwtaa;
    
    wtComp["3-methyl-furoic acid(wtPCT)"] = 100 *(mwtfa/totMoleWt);
    wtComp["acetic acid(wtPCT)"] = 100 * (mwtaa/totMoleWt);        
          
    mathVals["comp"] = comp;
    mathVals["intTot"] = pGetIntTot(aSpectrum);
    mathVals["wtComp"] = wtComp;
    mathVals["intNormValue"] = intTot/100;    
            
    return mathVals;
}

