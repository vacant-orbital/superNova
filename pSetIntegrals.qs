/*
20Jun2022 rgpotter
refactorred 21Sep2023
*/

function pSetIntegrals(aspectrum, acuts)
{
	someRegs = [];
	someInts = Integrals();
	for (var iint = 0; iint < acuts.length; iint++)
	{
		someRegs[iint] = new SpectrumRegion(acuts[iint][0], acuts[iint][1]);
		someInts.append(Integral(aspectrum, someRegs[iint]));
	}
	aspectrum.setIntegrals(someInts);	
}	
