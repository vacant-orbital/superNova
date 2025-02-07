function pMakeSpectrum(anarray, aArgsObject)
{
    var doc = new Document(Application.mainWindow.activeDocument);    
    var crpg = doc.page(0);
    var spec = NMRSpectrum(crpg.itemsByName("NMR Spectrum")[0]);
    
    var newPage = doc.newPage(1);
    
    var spec1 = newPage.addItem(new NMRSpectrum({
       1: {nucleus: '1H', frequency: 399.9434225, from_ppm: -2.013867861684861, to_ppm: 14.014040211387648, size: 65536},
       filename: 'C:\\Users\\jondoe\\Documents\\NMR\\rawData\\asuitablefilename.REC\\acqfil\\fid',
       origin: 'Varian',
       title: 'acqfil'
       }
       )       
    );               
}
    
     