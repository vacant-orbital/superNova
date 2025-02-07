function parametersForMemo()
{
    var spec = new NMRSpectrum(nmr.activeSpectrum());
    print("Data File Name:\t", spec.getParam("Data File Name"));
    print("Title:\t", spec.getParam("Title"));
    print("Comments:\t", spec.getParam("Comment"));
    print("Origin:\t", spec.getParam("Origin"));
    print("Instrument:\t", spec.getParam("Instrument"));
    print("Author:\t", spec.getParam("Author"));
    print("Solvent:\t", spec.getParam("Solvent"));
    print("Temperature:\t", spec.getParam("Temperature"));
    print("Pulse Sequence:\t", spec.getParam("Pulse Sequence"));
    print("Experiment:\t", spec.getParam("Experiment"));
    print("Probe:\t", spec.getParam("Probe"));
    print("Number of Scans:\t", spec.getParam("Number of Scans"));
    print("Receiver Gain:\t", spec.getParam("Receiver Gain"));
    print("Relaxation Delay:\t", spec.getParam("Relaxation Delay"));
    print("Pulse Width:\t", spec.getParam("Pulse Width"));
    print("Acquisition Time:\t", spec.getParam("Acquisition Time"));
    print("Acquisition Date:\t", spec.getParam("Acquisition Date"));
    print("Modification Date:\t", spec.getParam("Modification Date"));
    print("Spectrometer Frequency\t", spec.getParam("Spectrometer Frequency"));
    print("Spectral Width:\t", spec.getParam("Spectral Width"));
    print("Lowest Frequency:\t", spec.getParam("Lowest Frequency"));
    print("Nucleus:\t", spec.getParam("Nucleus"));
    print("Acquired Size:\t", spec.getParam("Acquired Size"));
    print("Spectral Size:\t", spec.getParam("Spectral Size"));
    print("Digital Resolution:\t", spec.getParam("Digital Resolution"));
}