function example2InsetMath(aspectrum, amathflag) //potter 28Mar2023, revised 22Sep2023
{
    var mathVals = {};
    var comp = {};         
    var intTot = aspectrum.integrals().at(0).integralValue() + aspectrum.integrals().at(1).integralValue();
    comp["A"] = (aspectrum.integrals().at(0).integralValue()/intTot).toFixed(2); 
    comp["B"] = (aspectrum.integrals().at(1).integralValue()/intTot).toFixed(2);             
    mathVals["comp"] = comp;
    mathVals["intTot"] = intTot;    
    return mathVals;
}

