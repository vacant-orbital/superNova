// this javascript version doesn't have a good round function
// this one rounds to the number of decimals defined by precision -- default is 0 
function pRound(value, precision) 
{
   	    var multiplier = Math.pow(10, precision || 0);	
   	    return Math.round(value * multiplier) / multiplier;
}    	    