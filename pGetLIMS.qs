//this function is used to scrape the LIMS number from varian and Bruker spectra 
function pGetLIMS(spc)
{
	var dfn = spc.getParam("Data File Name");				
	var myRegexp4 = /\_\d{5,7}/;   // 16May2023  changed from /\_\d{5,7}\_/
	var myRegexp5 = /\/\d{7}\//;
	var match4 = myRegexp4.exec(dfn);	
	if (match4 == null || match4 == undefined)
	{
	    match4 = myRegexp5.exec(dfn);
	}
	return match4;
}			    