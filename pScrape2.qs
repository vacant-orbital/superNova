function pScrape2(aregex, afilename)//rgp 28Aug2023 function for grepping acqu and acqus
{                                  //returns the characters after the match of the regex or null if nome found  
    var line;
    var file1 = File(afilename);	        
    var txtStrm = TextStream(file1);
    file1.open(1);
    while (line = txtStrm.readLine())
    {
        //print(line);    
        if (aregex.match(line))//changed from exec()
        {        
            file1.close();
            return aregex.exec(line);            
        }                    
    }            
    file1.close();
    return null;
}