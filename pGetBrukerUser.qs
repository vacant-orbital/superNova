

function pGetBrukerUser(aspectrum)
{
	//var aspectrum = new NMRSpectrum(nmr.activeSpectrum());
	var i;	
	var str = aspectrum.getParam("Comment").split(/\n/);
	var fish = "username";
	for (i = 0; i < str.length; i++)
	{
		if(str[i].match("User"))
		{		
			fish = str[i]; 
		}
	}		
	var myRegexp = /\s.*/;
	if (fish.match(myRegexp) !== null)
	{
		return fish.match(myRegexp)[0].trim();
	}
	else
	{
		return fish;
	}
}