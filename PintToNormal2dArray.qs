/*  
20Jun2022 rgpotter
This class creates an object that holds a regular array with wrapper functions to handle the reverse order associated with the mnova nmr intensities array--like the one returned from spec.real("all")
*/
function PspectrumToNormal2dArray(spect, ppmRange) //use [low, high] for ppmRange
{
    this.ar = [];
    if (ppmRange !== null && ppmRange !== undefined)
    {   
        this.limits = ppmRange     
    }        
    var tmpNMRarr1 = spect.real("all");
    //tmpNMRarr1 = tmpNMRarr1.reverse(); //change the intensities to match an ascending chemical shift array
    var sw = parseFloat(spect.getParam("Spectral Width"))/parseFloat(spect.getParam("Spectrometer Frequency"));    
    var lowFreq = parseFloat(spect.getParam("Lowest Frequency"))/parseFloat(spect.getParam("Spectrometer Frequency"));
    var highFreq = lowFreq + sw;
    var spacing = sw/((tmpNMRarr1.length)-1);
    var tmpNMRarr2 = [];
      
    for (var stnai =  0; stnai < tmpNMRarr1.length; stnai++)
    {   
        var tmpXY = [];     
        tmpXY.push(lowFreq + (stnai * spacing));
        tmpXY.push(tmpNMRarr1[tmpNMRarr1.length - stnai -1]);        
        tmpNMRarr2.push(tmpXY);
        
    }        
    tmpNMRarr1.length = 0;      
    
    this.ar = tmpNMRarr2;             
}	        

PspectrumToNormal2dArray.prototype =
{
    printIntensities: function()
        {
	        //for(i=0; i<this.ar.length; i++)
	        for(i=0; i<100; i++)
	        {
		        print(this.ar[i][1]);
	        }
        },
    printChemicalShifts: function()
        {
	        for(i = 0; i < this.ar.length; i++)
	        //for(i=0; i<1000; i++)
	        {
		        print(this.ar[i][0]);
	        }
        },	 

    trimAr: function()
    {    
        var tempo1 = []   
        for (var snoop = this.greaterThanValue(this.limits[0]); snoop < this.lessThanValue(this.limits[1]); snoop++)
        {        
            tempo1.push(this.ar[snoop]);
        }
        this.ar = tempo1;                       
    },  
                
    getCollumn: function(col)
        {
	         var collumn = [];
	         for (i=0; i<this.ar.length; i++)
	         {
		        collumn.push(this.ar[i][col]);
	         }
	         return collumn;
        },
    getCollumnRev: function(col)
        {
	         var collumn = [];
	         for (i=this.ar.length-1; i > 0; i--)
	         {
		        collumn.push(this.ar[i][col]);
	         }
	         return collumn;
        },	         

	
    round: function(value, precision) 
		{
   			var multiplier = Math.pow(10, precision || 0);
   			return Math.round(value * multiplier) / multiplier;
   		},  
   		 			
    greaterThanValue: function(value) //returns row index of the 2D array based on the where ar[i][0] becomes greater than value
        {        		    
   			for (i=0; i<this.ar.length; i++)
   			{
   				if (this.ar[i][0]>value){return i; }
   			}   				  		
   		},
   		
    lessThanValue: function(value) //returns row index of the 2D array based on the where ar[i][0] becomes less than value
		{       			
   			for (i=0; i<this.ar.length; i++)
   			{
   				if (this.ar[i][0]>=value){return i-1; }
   			}   				  			
   		},  
   		
    getRangeIndicesRevArr: function(rng) //pass the chemical shift array to this function to get indices of 
		{                          //closest x-points to the integral limits
			tmparr =  [];   //new Array(rng.length);
			lowx = rng[0];
			highx = rng[1];									 
   			for (i=0; i< this.ar.length; i++)
   			{
   				if (this.ar[i][0]>highx)
   				{ 
   					tmparr[0]=i-1;   				
   					break;
   				}
   				
   			}
   			
   			for (i=tmparr[0]; i< this.ar.length; i++)
   			{      					
   				if (this.ar[i][0]>lowx)
   				{
   					tmparr[1]=i;   				
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
                          
          			 			    			   		
    pMean: function()
        {    
			 var sum1 = 0;
	        for (i=0; i<this.ar.length; i++)
	        {			
		        sum1 = sum1 + this.ar[i];
	        }
	        return sum1/this.ar.length;
        },
        
    dcFromAToBandReturnResultingSpec : function(anarray, aNewSpecObj)
        {
           var spec1 = new NMRSpectrum({
           1: {nucleus: '1H', frequency: 399.9434225, from_ppm: -2.013867861684861, to_ppm: 14.014040211387648, size: 65536},
           filename: 'C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\rawData\\f_AST-2019-0162_51846_08403101.REC\\acqfil\\fid',
           origin: 'Varian',
           title: 'acqfil'}           
           );
           
           if(spec1.isValid)
           {
	           nmr.beginModification(spec1);
	           spec1.setReal("all", this.ar.getCollumnRev(1));		           
	           nmr.endModification(spec1);
	       }
	       newPage.addItem(spec1);
       }	             	             
};
/*  
    linearIntegralCorrection: function(rngInd) 
        {                                                  
	        a = pMean([this.ar[rngInd[0]-2], this.ar[rngInd[0]-1], this.ar[rngInd[0]]]); //low index side
	        b = pMean([this.ar[rngInd[1]], this.ar[rngInd[1]+1], this.ar[rngInd[1]+2]]); //high index side
	        disInd = rngInd[1] - rngInd[0];
	        print("a: " + a + " b: " + b);
	        print("disInd: " + disInd);
	        if (a>b)
	        {	
		        for (i=0;i<rngInd[0]; i++)	    
		        {				    
		            xyVals[i][2] = this.ar[i];	
		        }
		        for(i=rngInd[0]; i<rngInd[1]; i++)  
		        {				
			        xyVals[i][2] = this.ar[i] - (b + (rngInd[1]-i)*((a-b)/disInd));
		        }
		        for (i=rngInd[1]; i<this.ar.length; i++)
		        {		
			        xyVals[i][2] = this.ar[i];
		        }						
	        }		    
	        else
	        {
                for (i=0;i<rngInd[0]; i++)
		         {		
			          xyVals[i][2] = this.ar[i];
		         }			
		         for(i=rngInd[0]; i<rngInd[1]; i++)
		         {		
			          xyVals[i][2] = this.ar[i] - (i-rngInd[0])*((b-a)/disInd);		
		         }	
		         for (i=rngInd[1]; i<this.ar.length; i++)
		         {		
			         xyVals[i][2] = this.ar[i];					
		         }													
	        }
        }	  
*/              
