function acqscraper(fn)//eventually use filename as arg.  done rgp 09Dec2024
{
    var myDSregexp = /##\$DS= .*/; //just use part of the usb path after ##$DS=
    //const DSre = new RegExp("hel");
    //filename = "D:\\ethicon\\23Aug2023\\AC_2023_291_3974895\\10\\acqus"  
    var filename = fn    
    var txt1 = "thishelloistheday##$DS= tobuygroceries";
    var line;
    var acqs = File(filename);	
    
    var txtStrm = TextStream(acqs);
    acqs.open(1);
    
    print(myDSregexp.exec(txt1));
    	
    while (line = txtStrm.readLine())
    {
        //print("while");
        if (myDSregexp.exec(line))
        {
            //
            //print("Found!!!!!!!!!!!!!!!!!!!!!!!");
            acqs.close()
            return myDSregexp.exec(line);            
        }  
        //print(line);          
    }
    
    acqs.close();
    return null;
}