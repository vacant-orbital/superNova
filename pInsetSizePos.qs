//version 1.0 -- potter 03Jan2023  changed top1 bot1 definitions 05Feb2025
// zoom now should be between -10 and 1.05 -- more positive to zoom in

//version 1.0 -- potter 03Jan2023

function pInsetSizePos(anInsetSpec, insetItem, insetObj, nmrArr)
{
    insetItem.width = insetObj["width"];
    insetItem.height = insetObj["height"];  
    
    if (nmrArr === undefined || nmrArr === null)
    {
        var nmrArr = new PspectrumToNormal2dArray(anInsetSpec);
    }
    
    //var topInset = nmrArr.pMax([5.0, 5.5]);
    //var botInset = nmrArr.pMin([5.0, 5.5]); 
    var topInset = nmrArr.pMax([insetObj.view.xmin, insetObj.view.xmax]);
    var botInset = nmrArr.pMin([insetObj.view.xmin, insetObj.view.xmax]);       
    var heightInset = topInset - botInset;

    if (insetObj.zoom === undefined || insetObj === null)
    {
    	var zoom = 0.0;
    }
    else if (insetObj.zoom >= 1.05)
    {
    	var zoom = 1.05;
    }
    else if (insetObj.zoom < -10.00)
    {
    	var zoom = -10.00;
    }     	
    else
    {
    	var zoom = insetObj.zoom;
    }  
                	
    var top1 = topInset - (zoom * heightInset) + (0.05 * heightInset);
    var curView = topInset - (zoom * heightInset) + (0.05 * heightInset) - botInset;
    var bot1 = botInset - (0.05 * curView);
      	    
    pSetView(anInsetSpec, bot1, top1, insetObj.view.xmin, insetObj.view.xmax);
         
}
