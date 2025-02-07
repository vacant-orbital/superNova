//mnova integrals objects have no total getter method
//this is a convenient function to retrieve this number rgp15Sep2023
function pGetIntTot(aspectrum)
{
	var tot = 0;
	for (i = 0; i < aspectrum.integrals().count; i++)
	{
		tot = tot + aspectrum.integrals().at(i).integralValue();
		//print(aspectrum.integrals().at(i).integralValue());
	}
	return tot;
}