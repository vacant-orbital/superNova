/*  
20Jun2022 rgpotter
This class creates an object that holds a regular array with wrapper functions to handle the reverse order associated with the mnova nmr intensities array--like the one returned from spec.real("all")
*/
function PspectrumToNormal2dArray(spect) //use [low, high] for ppmRange
{         
    this.spcInfo = pExtractSpectInfoObj(spect);
    this.ar = [];
    var tmpNMRarr1 = spect.real("all");    
    for (var stnai =  0; stnai < tmpNMRarr1.length; stnai++)
    {   
        var tmpXY = [];     
        tmpXY.push(this.spcInfo["lowFreq"] + (stnai * this.spcInfo["spacing"]));
        tmpXY.push(tmpNMRarr1[tmpNMRarr1.length - stnai -1]);        
        this.ar.push(tmpXY);
        
    }        
    tmpNMRarr1.length = 0;                 
}	        

PspectrumToNormal2dArray.prototype =
{
    printIntensities: function()
        {
	        //for(i=0; i<this.ar.length; i++)
	        for(iiii=0; iiii<100; iiii++)
	        {
		        print(this.ar[iiii][1]);
	        }
        },
    printChemicalShifts: function()
        {
	        //for(i = 0; i < this.ar.length; i++)
	        for(iiii=0; iiii<100; iiii++)
	        {
		        print(this.ar[iiii][0]);
	        }
        },	
        
    testgetCollumnRev: function()
        {       
	        tempRevCol = this.getCollumnRev(1);	   
	        for(iiii=0; iiii<100; iiii++)
	        {
		        print(tempRevCol[iiii]);
	        }
        },	
    
    writeCoords : function(filename)
       {
		    var txt = File(filename);	
		    var txtStm = TextStream(txt);
		    txt.open(2);
		    for(var ii = 0; ii < this.ar.length; ii++)
			    {
				    for(var jj = 0; jj < this.ar[ii].length; jj++)
				    {
					    txtStm.write(this.ar[ii][jj], "    ");	
				    }
				    txtStm.writeln("");
			    }
		    txt.close();
	    },			       
    
    ppmToIndex : function(ppm) //index closest to point (low side)
        {
            var ppmDistanceFromOrigin = ppm - this.spcInfo["lowFreq"];
            var pntsFromOrigin = Math.floor(ppmDistanceFromOrigin / this.spcInfo["spacing"]);            
            var nwppm = this.ar[pntsFromOrigin][0];            
            return pntsFromOrigin;
        }, 
    ppmToNextIndex : function(ppm) //index closest to point (high side)
        {
            var ppmDistanceFromOrigin = ppm - this.spcInfo["lowFreq"];
            var pntsFromOrigin = Math.floor(ppmDistanceFromOrigin / this.spcInfo["spacing"]);            
            var nwppm = this.ar[pntsFromOrigin][0];            
            return pntsFromOrigin + 1;
        }, 
        
    extractArrInfoObj : function()
    {            
        return {nucleus: this.spcInfo["nucleus"], frequency : this.spcInfo["Spectrometer Frequency"], from_ppm : this.ar[this.ar.length - 1][0], to_ppm : this.ar[0][0], size : this.ar.length}        
        
    },               

    trimAr: function(limits)
    {    
        var tempo1 = [] 
        var start1 = this.ppmToIndex(limits[0]);
        var end1 = this.ppmToIndex(limits[1]);  
        for (var snoop = start1; snoop < end1; snoop++)
        {                
            tempo1.push(this.ar[snoop]);
        }
        this.ar = tempo1;                       
    },  
                
    getCollumn: function(col)
        {
            //return(this.ar.map(x => x[col]));
	         var collumn = [];
	         for (ai=0; ai<this.ar.length; ai++)
	         {
		        collumn.push(this.ar[ai][col]);
	         }
	         return collumn;
        },
    getCollumnRev: function(col)
        {
	         var tmpCol = this.ar.map(function(x){return x[col]});
	         return tmpCol.reverse()	         
        },	         
        
    round: function(value, precision) 
		{
   			var multiplier = Math.pow(10, precision || 0);
   			return Math.round(value * multiplier) / multiplier;
   		},  
   		 	 		
    getRangeIndicesRevArr: function(rng) //pass the chemical shift array to this function to get indices of 
		{                          //closest x-points to the integral limits
			tmparr =  [];   //new Array(rng.length);
			lowx = rng[0];
			highx = rng[1];			
   			for (ai=0; ai< this.ar.length; ai++)
   			{
   				if (this.ar[ai][0]>highx)
   				{ 
   					tmparr[0]=ai-1;   				
   					break;
   				}
   				
   			}
   			
   			for (ai=tmparr[0]; ai< this.ar.length; ai++)
   			{      						
   				if (this.ar[ai][0]>lowx)
   				{
   					tmparr[1]=ai;   				
   					return tmparr; 
   				}
   			}
   		},      			
   		   		
   		
    getRangeIndices: function(rng, ar) //pass the chemical shift length = 2 array to this function to get indices of 
		{                          //closest x-points to the integral limits
			var tmparr = [];
			var lowx = rng[0];
			var highx = rng[1];
			if (ar == null || ar == undefined)
			{
			    ar = this.ar;
			}			    
   			for (var grii=0; grii<ar.length; grii++)
   			{
   				if (ar[grii][0]>=lowx)
   				{ 
   					tmparr[0]=grii;   				
   					break;
   				}
   				
   			}   				
   			for (var grij=0; grij<ar.length; grij++)
   			{      					
   				if (ar[grij][0]>=highx)
   				{
   					tmparr[1]=grij;   				
   					return tmparr; 
   				}
   			}
   		},   			
   		
    pMax : function(rng)
        {
            if (rng == null || rng == undefined)
            {
                var rng = [this.ar[0][0], this.ar[this.ar.length-1][0]];
            }
            
            
            var pMaxLowHigh = this.getRangeIndices(rng);            
            var tmpMax = this.ar[pMaxLowHigh[0]][1];  //intensity of the first point in the search (low end) -0.000015362980775535107 for the first spectrum

            for (var Xpoint = pMaxLowHigh[0]; Xpoint < pMaxLowHigh[1]; Xpoint++)
            {
                if (this.ar[Xpoint][1] > tmpMax)
                {
                    tmpMax = this.ar[Xpoint][1];
                }
            }
 
            return tmpMax;
        },
        
    pMin : function(rng)
        {
            if (rng == null || rng == undefined)
            {
                var rng = [this.ar[0][0], this.ar[this.ar.length-1][0]];
            }
            
            var pMaxLowHigh = this.getRangeIndices(rng);
            tmpMin = this.ar[pMaxLowHigh[0]][1];            
            for (var Xpoint = pMaxLowHigh[0]; Xpoint < pMaxLowHigh[1]; Xpoint++)
            {
                if (this.ar[Xpoint][1] < tmpMin)
                {
                    tmpMin = this.ar[Xpoint][1];
                }
            }  
            return tmpMin;
        },
                          
          			 			    			   		
    pMean: function(anar)
        {    
			 var sum1 = 0;
	        for (var wi=0; wi<anar.length; wi++)
	        {			
		        sum1 = sum1 + anar[wi];	        
	        }		        
	        return sum1/anar.length;
        },
        
    dcFromAToBandReturnResultingSpec : function(rng)
        {
           var DCspec = new NMRSpectrum({
           1 : this.extractArrInfoObj(),
           filename: 'inset created from parent spectrum',
           origin: 'Varian',
           title: 'acqfil'}           
           );
           
           
           rngIndices = this.getRangeIndices(rng);
           this.linearCorrection(rngIndices);
           if(DCspec.isValid())
           {
	           nmr.beginModification(DCspec);
	           DCspec.setReal("all", this.getCollumnRev(1));		           
	           nmr.endModification(DCspec);
	       }	           
	       return DCspec;	           
       },	             	             
         
    linearCorrection: function(rngInd) 
        {                                                  
	        var a = this.pMean([this.ar[rngInd[0]-2][1], this.ar[rngInd[0]-1][1], this.ar[rngInd[0]][1]]); //low index side (right, low ppm, side of spectrum)
	        var b = this.pMean([this.ar[rngInd[1]][1], this.ar[rngInd[1]+1][1], this.ar[rngInd[1]+2][1]]); //high index side (left, high ppm, side of spectrum)
	        var disInd = rngInd[1] - rngInd[0];	        
	        if (a<b)
	        {		        
		        for (i=0;i<this.ar.length; i++)	    //i<rngInd[0]
		        {				    
		            this.ar[i][1] = this.ar[i][1] - (a+((b-a)/disInd)*(rngInd[0]-i));//xyVals[i][2] = this.ar[i];	
		        }		                					
	        }	
	        else
	        {	        
	            for (i=0;i<this.ar.length; i++)	    //i<rngInd[0]
		            {				    
		                this.ar[i][1] = this.ar[i][1] - (b-((b-a)/disInd)*(rngInd[1]-i));//xyVals[i][2] = this.ar[i];	
		            }		            
	        }		            
        },
};
	
/*        
setReal (Number | String | Object aIndex, Number | Array aValue) : Boolean

Sets the real value of the aIndex point in the spectrum data. First argument could be set as an individual index of a point, as "all" or as an object with a range of points. See description of real for examples how to specify ranges of points. If multipoint range is specified, the second argument can be an array of numbers to fill the range. If a single number is specified along with a range of points, then the entire range will be filled with the number. Should be framed with nmr.beginModification/nmr.endModification.


List of parameters:
Number | String | Object aIndex
Number | Array aValue

				
setReal(5, 0.5)
setReal({from:0, to:3}, [0, 1, 2, 3]) 

real (Number | String | Object aIndex) : Number | Array

If a single number is provided as an argument, returns the real value of the aIndex point in the spectrum data. Argument "all" returns an array with real values of all points in the spectrum. A specific range of points can be specified as an object of the type {from:aIndexFrom, to:aIndexTo}.


List of parameters:
Number | String | Object aIndex

				
real(400); - returns real value of the point with index 400
real({from:0, to:512}); - returns real values for points with indexes from 0 to 512.
real("all") - returns real values of all points in the spectrum.
 
*/              
