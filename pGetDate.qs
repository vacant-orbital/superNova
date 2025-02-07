/*   this function scapes the spectrum for "Acquisition Date" timestamp and returns the part of the date
that the client is interested in year, month, day, etc.            */
function pGetDate(aspectrum, areturnType)
{
	var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
	var aqDate = aspectrum.getParam("Acquisition Date");
	var match2 = aqDate.match(/([^T]+)/);
	var dt = '' + match2[0];
    var parts =dt.split('-');
    var myDate = new Date(parts[0], parts[1] - 1, parts[2]); 
    var add = String(myDate.getDate());
    var amm = String(months[myDate.getMonth()]);
    var ayyyy = myDate.getFullYear();
    var strDate = amm + ' ' + add + ', ' + ayyyy;  
    if (areturnType == "day")
    {
    	return add;
    }
    else if (areturnType == "month")
    {
    	return amm;
    }
    else if (areturnType == "year")
    {
    	return ayyyy;
    }
    else
    {
    	return strDate;
    }    	
}