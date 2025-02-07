function pExtractSpectInfoObj(aspect){
    var sio = {};
    sio["sw"] = parseFloat(aspect.getParam("Spectral Width"))/parseFloat(aspect.getParam("Spectrometer Frequency"));    
    sio["lowFreq"] = parseFloat(aspect.getParam("Lowest Frequency"))/parseFloat(aspect.getParam("Spectrometer Frequency"));
    sio["highFreq"] = sio["lowFreq"] + sio["sw"];
    sio["spacing"] = sio["sw"]/((aspect.count())-1); 
    sio["nucleus"] = aspect.getParam("Nucleus");
    sio["Spectrometer Frequency"] = aspect.getParam("Spectrometer Frequency");     
    return sio;
}