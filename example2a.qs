function example2a()
{   //potter Jun2024 jobscript for calculating mol percent furoic acid in acetic acid.  Displays blow up of 1.40 - 0.95 ppm region. Turns inset integration off by setting inset cuts to null.
    ex2obj = new Pstudy();
    ex2obj.suFunc = pSetupBc;         
    ex2obj.blindRegions = [[8.459, 8.355],[7.606, 6.277],[5.230, 4.295],[2.900, 1.608],[1.173, 1.107],[1.061, 1.004]];
    ex2obj.refBCfunc = pRefBCd2o;    
    ex2obj.cuts = [[8.587,	8.427],[7.737,	6.99],[6.99, 6.327],[2.777,	2.317],[2.257,	1.767],[1.267,	1.217], [1.167,	1.097]];	               
    ex2obj.mathFunc = example1Math;	
    ex2obj.mathFlag = true;
    ex2obj.brukerHomeDir = "C:/Users/rpotter1/Documents/";
    ex2obj.intfilename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\example2a_int.dat"; 
    ex2obj.compfilename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\example2a_comp.dat"; 
    ex2obj.pbox.macroname = "example2a";
    ex2obj.pbox.stats.getTMSlw = false;
    ex2obj.pbox.height = 150.0;
    //ex2obj.yViewMin = -0.8;  //good value for regular probe
    //ex2obj.yViewMax = 300;  //good value for regular probe
    ex2obj.yViewMin = -300;  //good value for cryoprobe or many scans
    ex2obj.yViewMax = 300000;  //good value for cryoprobe or many scans  
    ex2obj.xViewMin = 1.00;  
    ex2obj.xViewMax = 8.00;               
    ex2obj.setView = pSetView; 
    ex2obj.dirLabel["x"] = 0; 
    ex2obj.dirLabel["y"] = 195;        
    ex2obj.createInset = {height : 80, width : 80, cuts : null, view : {xmin : 0.90, xmax : 1.40}, ints     : Integrals(), regs1 : [], mathFunc : null, normInt : null, newSpecArgs : {DCmin : 0.90, DCmax : 1.30},           coordsFile : "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\example2a_coords.dat", mathFlag : false, zoom : 0.00, 
           };
    ex2obj.insetProcFunc = pInsetProcess;    
    ex2obj.processSelectedSpectra();    
}

/*
Normal spec dimentiontions: height 206.92533333333333  width 269.9173333333333    left 459.5283333333333    right 729.4456666666666
*/