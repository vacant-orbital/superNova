/* 
This is a class which represents the most basic NMR study.  For most studies one can create a Pstudy object and add/overwrite attributes and methods to customize. potter 28Mar2023, revised 22Sep2023 
*/
function Pstudy()
{   
    this.doc = new Document(Application.mainWindow.activeDocument);	
}

Pstudy.prototype = {
	varianHomeDir : "/home/Walkup/vnmrsys/Automation/",//if using varian data replace with path to where your data is stored
	dirLabel : {x : -21, y : 175, height : 10.0, width : 50.0, apply : true},//original values x:0, y:198
	originalPages : {}, //place the all the documents pages (before execution of macro) in a dict
	selection : {},  //likewise with the pages selected just prior to runtime of the macro
	blindRegions : [], //populated in the specific child study (eg. pPds.qs)
	regs1 : [],
	ints : Integrals(),	
	cuts : [],  //populated in the specific child study (eg. pPds.qs)
	blindRegs : [], //this gets polulated from blindRegions
	composition : null,	
	setView : null, //function assigned in the specific child study (eg. pPds.qs)
	yViewMin : null, //assigned in the specific child study (eg. pPds.qs)
	yViewMax : null, //assigned in the specific child study (eg. pPds.qs)	
	xViewMin : null, //assigned in the specific child study (eg. pPds.qs)
	xViewMax : null, //assigned in the specific child study (eg. pPds.qs)			
	fullView : false, //whether to reset to full zoom and width
	suFunc : null, //function assigned in the specific child study (eg. pPds.qs)	
	mathFunc : null, //function assigned in the specific child study (eg. pPds.qs)	
	allInts : [], //populated by processSelectedSpectra (below)
	allComps : [],
	refBCfunc : null, //function assigned in the specific child study (eg. pPds.qs)	
	pbox : {drawpbox : true, height : null, macroname : "not assigned", stats : {"getTMSlw" : false}},	
	normIntVals : {"normInt" : null},  
	createInset : null,
	insetProcFunc : null,
	insetSpec : null,
	insetBox : null,
	moveSpec : false,	// check below if this is still used.  now we are adjusting for int labels through setview
	specInfo: null,
	intfilename : null, // path assigned in the specific child study (eg. pPds.qs)		
	compfilename : null,	
    processSelectedSpectra : function()
	{	
	    this.originalPages = [];
	    this.selection = {};
	    var opar = this.doc.pagesIds();	    
	    for (var opara=0; opara < opar.length; opara++) 	
	    {	    
	      this.originalPages[opar[opara]] = opara;	    
	    }	      
	    for (var a=0; a < this.doc.selectedPages().length; a++) 	
	    {	    
	      this.selection[this.doc.selectedPages()[a].uuid] = a;	    
	    }	      	      	    
	    for (key in this.selection) 
    	{	    	    	    
            this.doc.setCurPage(key);
            var crpg = this.doc.page(key); 
            if (this.pbox.macroname == "pWft")
            {
            	crpg.deleteItems(crpg.itemsByName("Text"));
            }
            if (crpg.itemsByName("Text").length > 0 && this.pbox.macroname !== "pWft")
            {
                continue;
            }                               	            	    	
            var spec = NMRSpectrum(crpg.itemsByName("NMR Spectrum")[0]);		            	    		        	                
            var p = spec.proc;		    		    		        	    
            var suMod = this.suFunc(spec, p);   
            spec.process(p);   //This is the fourier transform/EM/etc...moved here from pSetupSpecProcParams on 17May2023                              		    		             //Only call this function once before the apres-FT stuff is applied
            p.setParameter("PP.useSensitivity_f1", true);
            p.setParameter("PP.Apply", true);  //hack for the Mnova peak fitting bug.  turned off after next block                      
            if (this.blindRegions !== null && this.refBCfunc !== null)
            {
                var prbObj = this.refBCfunc(spec, this.blindRegions, this.blindRegs); 
                if (this.pbox.stats.getTMSlw)
                {
                    this.pbox.stats.tmsLineWidth = pTmsRefStats(spec);                	        	           
                }		            
            }
            spec.setProperty("peaks.show", false);
            if (this.cuts !== null) //if integral cuts are provided, integrate and normalize (default is total of 100.0)
            {            
                pSetIntegrals(spec, this.cuts);
                if (this.mathFunc !== null)
                {                
                	this.composition = this.mathFunc(spec, this.mathFlag);
                	//print("intTot: " + this.composition.intTot);
                	this.normIntVals.intTot = this.composition.intTot;
                }                	                	
                else
                {
                	this.normIntVals.intTot = null;
                	this.composition = {"unread" : true}
                }
                pNormInts(spec, this.normIntVals); 
                if (!this.composition.hasOwnProperty("intNormValue") || this.composition["intNormValue"] == null)
                {
                	//print("no composition.intNormValue found!");
                	this.composition["intNormValue"] =  this.normIntVals["pnormintvalue"]; 
                }            	
                	//this.composition["unread"] = true;                                   
            }    
            if (this.setView !== null)
            {		    
                this.setView(spec, this.yViewMin, this.yViewMax, this.xViewMin, this.xViewMax);		    
            }	
            if (this.fullView)
            {
            	spec.fitToHighestCompound();
            	spec.horzZoom();
            }                
            crpg.itemsByName("NMR Spectrum")[0].height = 196.0;  
            if (this.compfilename !== null)
            {  
            	 //print("compfile found!");          
                if (this.allComps.length == 0)
                {
                    var header = [];
                    header.push("LIMS");
                    var wrd, drw, dw, dpgw;
               
                    for (wrd = 0; wrd <  Object.keys(this.composition.comp).length; wrd++)
                    {
                        header.push( Object.keys(this.composition.comp)[wrd]);
                    }
                    if (this.composition.hasOwnProperty("sequen"))
                    {
                    	for (drw = 0; drw <  Object.keys(this.composition.sequen).length; drw++)
                    	{
                      	header.push( Object.keys(this.composition.sequen)[drw]);
                    	}
                    } 
                    if (this.composition.hasOwnProperty("wtComp"))
                    {
                    	for (dw = 0; dw <  Object.keys(this.composition.wtComp).length; dw++)
                    	{
                      	header.push( Object.keys(this.composition.wtComp)[dw]);
                    	}
                    }                    	    
                    if (this.composition.hasOwnProperty("pegComp"))
                    {
                    	//print("got it!");
                    	for (dpgw = 0; dpgw <  Object.keys(this.composition.pegComp).length; dpgw++)
                    	{
                      	header.push( Object.keys(this.composition.pegComp)[dpgw]);
                    	}
                    }                    	                                       
                    this.allComps.push(header);                                       	                                      	
                }                                                       	
                pBuildMultiSpectraCompArray(spec, this.allComps, this.composition);
                if (this.composition.comp.hasOwnProperty("(B/A)+1"))
                    {                
                    	delete this.composition.comp["(B/A)+1"];
                    }                    			
            }
            if (this.intfilename !== null)
            //print("infilename is ok!");
            {
                if (this.allInts.length == 0)
                {
                    var header = [];
                    header.push("LIMS");
                    var wrd;
                    //for (wrd = 0; wrd <  Object.keys(this.composition.comp).length; wrd++)
                    for (wrd = 0; wrd <  spec.integrals().count; wrd++)
                    {
                        //header.push( Object.keys(this.composition.comp)[wrd]);
                        header.push("Integral_" + (wrd + 1));
                    }
                    this.allInts.push(header);
                }
                pBuildMultiSpectraIntArray(spec, this.allInts, this.composition);		
            }                                                          
            if (this.pbox.drawpbox)  
            {                                 
                pboxRegex(spec, this.pbox);
                params = pParameterBox(spec, p, this.composition, this.pbox);
                pAddPbox(crpg, params, this.pbox);                    
            }                                      	        		    		                                                                     
            if (this.createInset !== null)
            {                            
                this.specInfo = pExtractSpectInfoObj(spec);
                var arrObj1 = new PspectrumToNormal2dArray(spec);                                                
                //this.insetSpec = arrObj1.dcFromAToBandReturnResultingSpec([5.0, 5.5]);
                this.insetSpec = arrObj1.dcFromAToBandReturnResultingSpec([this.createInset.newSpecArgs.DCmin, this.createInset.newSpecArgs.DCmax]);  
                crpg.addItem(this.insetSpec);
                var insetSpecItem = crpg.itemsByName("NMR Spectrum")[1]
                this.insetSpec.left = crpg.itemsByName("Text")[0].right + 20;                
                this.insetSpec.top = crpg.top;                 
                var insProc = this.insetSpec.proc; 
                pInsetSizePos(this.insetSpec, insetSpecItem, this.createInset, arrObj1);                                 
                this.insetProcFunc(this.insetSpec, this.createInset);                                          
                pNormInts(this.insetSpec, this.createInset);   
                pAppendComp(this.createInset["comp"], this.allComps);
                if (this.createInset["comp"] !== undefined)
                {                                                        
                	var sqnBx = pInsetSequenBox(crpg, this.createInset["comp"], 28.0, 44);                                               
                }
                //arrObj1.writeCoords(this.createInset["coordsFile"]);
            }                
            if (/Varian/.exec(spec.getParam("Origin")))
            {
                this.dirLabel["homeDir"] = 	this.varianHomeDir;	            
                if (this.dirLabel.apply)
                {
                	pDirLabel(crpg, spec, this.dirLabel);
                }
            }
            else
            {               
                this.dirLabel["homeDir"] = 	"D:\\nmrdata\\" + pGetDate(spec, "year") + "\\" + pGetBrukerUser(spec);                  
                if (this.dirLabel.apply)
                {
                	pDirLabel(crpg, spec, this.dirLabel);
                }
            }                            
            spec.update();
            tmpIds = this.doc.pagesIds()
            for (pgid=0; pgid < tmpIds.length; pgid ++)
            {            
                if (!(tmpIds[pgid] in this.originalPages))
                {                
                    this.doc.deletePages(tmpIds[pgid]);
                }
            } 
                           
                                   								                
        }            
        if (this.intfilename !== null)
        {
        	//print("intfile still good!");
            pWriteIntsToFile(this.allInts, this.intfilename);
        }	
        this.allInts.length=0;
        if (this.compfilename !== null)
        {
        	pComptoFile(this.allComps, this.compfilename);
        }
        this.allComps.length=0;
    }				
}
