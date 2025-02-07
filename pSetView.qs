function pSetView(aSpec, vmin, vmax, hmin, hmax)
{
    if(vmax === undefined || vmax === null)
	{
	    vmax = 0.1;
	}
    if(vmin === undefined || vmin === null)
	{
	    vmin = -0.01;
	}
	
	if(hmax === undefined || hmax === null)
	{
	    hmax = 6.5;
	}
    if(hmin === undefined || hmin === null)
	{
	    hmin = 0.5;
	}	    
				    	    
    aSpec.horzZoom(hmin, hmax);
    aSpec.vertZoom(vmin, vmax);      
}