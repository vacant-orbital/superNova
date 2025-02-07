function canDeleteMath(aspectrum, amathflag)
{
	var mathVals = {};
	var comp = {}; 
	var solventInt, waterInt;
	if (aspectrum.integrals().at(0).integralValue() == null || aspectrum.integrals().at(0).integralValue() <= 0)
	{
	solventInt = 0;
	}
	else
	{
	solventInt = aspectrum.integrals().at(0).integralValue();
	}
	if (aspectrum.integrals().at(1).integralValue() == null || aspectrum.integrals().at(1).integralValue() <= 0)
	{
	waterInt = 0;
	} 
	else
	{
	waterInt = aspectrum.integrals().at(1).integralValue();
	}
	
    var intTot = solventInt + waterInt;
    comp["solvent"] = (100*(solventInt/(intTot))).toFixed(2);
    comp["water"] = (100*(waterInt/(intTot))).toFixed(2);       
    mathVals["comp"] = comp;
    mathVals["intTot"] = intTot;
    mathVals["intNormValue"] = intTot/100;    //grosIntTot/100;
    return mathVals;    
}

