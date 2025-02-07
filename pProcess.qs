function pProcess()
{
    //var project, study;
    var macros = {"monocryl" : pCapGly, "vicryl" : pVcal, "pds" : pPds, "pegsg,pegnh,capso" : pSealCap, "pegsg,pegnh,ampso" : pSealAmp, "patches, gen1 algorithm" : pPatch};
    var matCbArr = [];
    var materials = [];
    var material = null;
    var dlg1 = new Dialog();
    dlg1.title = "Ethicon NMR Processing Module";    
    
    var projCmbBox = new ComboBox();
    projCmbBox.addItem("Select a project...");
    projCmbBox.addItem("Wound Closure");
    projCmbBox.addItem("SEALion");
    projCmbBox.addItem("Bubblegum");
    dlg1.add(projCmbBox);
    //var project = projCmbBox.currentText;    
    dlg1.exec(); 
       
    
    
    if (projCmbBox.currentText == "SEALion")
    {
        print("Evaluated the If statement");
        //var dlg1 = new Dialog();
        var sCmbBox = new ComboBox();
        sCmbBox.addItem("Select a study...");
        sCmbBox.addItem("Extraction");
        sCmbBox.addItem("Patches");    
        dlg1.add(sCmbBox);
        dlg1.exec();     
    }
    
    if (projCmbBox.currentText == "Wound Closure")
    {
        print("Evaluated the If statement");
        //var dlg1 = new Dialog();
        var sCmbBox = new ComboBox();
        sCmbBox.addItem("Select a study...");
        sCmbBox.addItem("pds");
        sCmbBox.addItem("vicryl");
        sCmbBox.addItem("monocryl");     
        dlg1.add(sCmbBox);
        dlg1.exec();     
    }        
    
    
    if (sCmbBox.currentText == "Extraction")
    {
        print("Evaluated the extraction If statement");
        //var dlg1 = new Dialog();
        var components = ["pegsg", "pegnh", "mbnw (monocryl)", "capso", "ampso", "tocopherol"];
        //var cbArr = [];
        for (var comp = 0; comp < components.length; comp++)
        {
            //print("Hoo!!!");
            //cbArr[comp] = new CheckBox();
            var newCB = new CheckBox();
            //print(components[comp]);
            //cbArr[comp].text = components[comp];
            print(typeof(components[comp]));
            newCB.text = components[comp];
            
            //print
            dlg1.add(newCB);
            
        }
        print("exited for loop!!!");
        dlg1.exec();
   
    } 
    
    if (sCmbBox.currentText == "Patches")
    {        
        var spectralResolution = ["patches, gen1 algorithm", "patches, good linewidth (c.a. < 2 Hz)", "patches, poor linewidth (c.a. > 2 Hz)"];    
        for (var lw = 0; lw < spectralResolution.length; lw++)
        {        
            matCbArr[lw] = new CheckBox();                
            matCbArr[lw].text = spectralResolution[lw];            
            dlg1.add(matCbArr[lw]);                
        }            
        dlg1.exec();
   
    } 
    
    if (sCmbBox.currentText == "vicryl")
    {        
        material="vicryl"   
    }   
    
    //print("current text: " + projCmbBox.currentText); 
    project = projCmbBox.currentText;
    study = sCmbBox.currentText;   
    var mInx = 0;
    for (var mat = 0; mat < matCbArr.length; mat++)
    {
        if(matCbArr[mat].checked)
        {
            
            print(matCbArr[mat].text);
            materials[mInx] = matCbArr[mat].text;
            mInx++;
        }
    }
    mInx = 0;
    //print("project: " + project + ", study: " + study + ", material(s): " + materials.join());   
    if (materials.length > 0 && materials.join() in macros)
    {
        macros[materials.join()]();
        //print("launched " + materials.join());
    } 
    if (material !== null)
    {
        macros[material]();
    }     
    
}