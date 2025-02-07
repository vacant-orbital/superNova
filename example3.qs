function example3()
{   //potter Jun2024  jobscript for calculating mol% 3,5-diterbutyl-2-hydroxybenzoicaldehyde vs Bisphenol A in DMSO-d6
    ex3obj = new Pstudy();
    ex3obj.suFunc = pSetupBc;
    ex3obj.blindRegions = [[12.30, 11.00],[10.28, 9.67],[9.53, 8.33],[7.93, 6.16],[4.05, 0.49]];
    ex3obj.refBCfunc = pRefBCdmso;        
    ex3obj.cuts = [[12.037, 11.208],[10.295, 9.607],[9.422, 8.694],[7.927, 7.277], [7.204, 7.123], [7.277, 6.854],[6.854,	6.360], [2.064, 0.630]];         
    ex3obj.mathFunc = example3Math;
    ex3obj.intfilename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\example3_int.dat";
    ex3obj.compfilename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\example3_comp.dat";
    ex3obj.pbox.macroname = "example3";
    //ex3obj.pbox.stats.getTMSlw = true;
    //ex3obj.pbox.stats["getTMSlw"] = true;         
    ex3obj.pbox.height = 170.0;
    ex3obj.setView = pSetView;        
    //ex3obj.yViewMin = -1.0;  //good value for regular probe
    //ex3obj.yViewMax = 300;  //good value for regular probe 
    ex3obj.yViewMin = -300; //good value for many scans or cryoprobe
    ex3obj.yViewMax = 150000; //good value for many scans or cryoprobe 
    ex3obj.xViewMin = 0.50;
    ex3obj.xViewMax = 12.50;      
    ex3obj.dirLabel["x"] = -20;    
    ex3obj.dirLabel["y"] = 178;                    
    ex3obj.processSelectedSpectra();    
}

/*
Normal spec dimentiontions: height 206.92533333333333  width 269.9173333333333    left 459.5283333333333    right 729.4456666666666
*/