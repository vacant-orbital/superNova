function example1()
{   //potter Jun2024 script for calculating mol percent furoic acid vs acetic acid in D2O
    ex1obj = new Pstudy();
    ex1obj.suFunc = pSetupBc;
    ex1obj.blindRegions = [[8.459, 8.355],[7.606, 6.277],[5.230, 4.295],[2.900, 1.608],[1.173, 1.107],[1.061, 1.004]];
    ex1obj.refBCfunc = pRefBCd2o;        
    //ex1obj.cuts = [[8.743,	8.583],[7.893,	7.183],[7.123,	6.483],[2.933,	2.473],[2.413,	1.923],[1.423,	1.373], [1.323,	1.253]];
    ex1obj.cuts = [[8.587,	8.427],[7.737,	6.99],[6.99, 6.327],[2.777,	2.317],[2.257,	1.767],[1.267,	1.217], [1.167,	1.097]];         
    ex1obj.mathFunc = example1Math;
    ex1obj.intfilename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\example1_int.dat";
    ex1obj.compfilename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\text\\example1_comp.dat";
    ex1obj.pbox.macroname = "example1";
    //ex1obj.pbox.stats.getTMSlw = true;
    //ex1obj.pbox.stats["getTMSlw"] = true;         
    ex1obj.pbox.height = 170.0;
    ex1obj.setView = pSetView;        
    //ex1obj.yViewMin = -1.0;  //good value for varian data
    //ex1obj.yViewMax = 300;  //good value for varian data 
    ex1obj.yViewMin = -300; //good value for many scans or cryoprobe
    ex1obj.yViewMax = 150000; //good value for many scans or cryoprobe 
    ex1obj.xViewMin = 1.00;
    ex1obj.xViewMax = 9.00;      
    ex1obj.dirLabel["x"] = -20;    
    ex1obj.dirLabel["y"] = 178;                    
    ex1obj.processSelectedSpectra();    
}

/*
Normal spec dimentiontions: height 206.92533333333333  width 269.9173333333333    left 459.5283333333333    right 729.4456666666666
*/