function canDelete()
{   //potter 22Oct2024 measures integral of H2O/HDO vs the residual CHCl3 solvent peak.  
//  Use for comparing water levels for CDCl3 wth same supplier and lot number  
    cDs = new Pstudy();
    cDs.suFunc = pSetupBc;         
    cDs.blindRegions = [[7.70, 6.80],[1.80,0.75]];
    cDs.refBCfunc = pRefBCcdcl3;    
    cDs.cuts = [[7.45, 7.06], [1.68, 1.37]];	               
    cDs.mathFunc = canDeleteMath;	
    //cDs.mathFlag = true;    
    cDs.intfilename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\canDelete_int.dat"; 
    cDs.compfilename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\canDelete_comp.dat"; 
    cDs.pbox.macroname = "canDelete";
    //cDs.pbox.stats.getTMSlw = true;
    cDs.pbox.height = 150.0;
    cDs.yViewMin = -0.8;  //good value for varian data
    cDs.yViewMax = 300;  //good value for varian data
    //cDs.yViewMin = -300;  //good value for bruker data
    //cDs.yViewMax = 300000;  //good value for bruker data 
    cDs.xViewMin = 0.5;  
    cDs.xViewMax = 8.0;                      
    cDs.setView = pSetView; 
    cDs.dirLabel["x"] = 0; 
    cDs.dirLabel["y"] = 195;        
    cDs.createInset = {height : 80, width : 80, cuts : null, view : {xmin : 0.5, xmax : 2.5}, zoom : 1.04, ints : Integrals(), regs1 : [], mathFunc : null, normInt : null, newSpecArgs : {DCmin : 2.50, DCmax : 0.5}, coordsFile : "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\canDelete_coords.dat", mathFlag : false,    
           };
    cDs.insetProcFunc = pInsetProcess;    
    cDs.processSelectedSpectra();    
}

/*
Normal spec dimentiontions: height 206.92533333333333  width 269.9173333333333    left 459.5283333333333    right 729.4456666666666
*/