function pTest()
{
   //var myRegex = /##\$DS= (.*)/;
   
   //var myRegex = /##\$P= [\s\S]+([0-9]{1,3})/m;
   //var myRegex = /##\$P=.+[\r\n]+[0-9]{1,3}/m;  //[\r\n]+([0-9]{1,3})/m;
   var myRegex1 = /##\$P= /;
   var myRegex2 = /([0-9]{1,3})\s/;
   //var myRegex = new RegExp('##\$P= .+');//[\s\S]+?([0-9]+)', 'm');
   var multiline = "12\n23\n43\nlettuce\n##\$P= (0..63)\n99 breakfast";
   //var myRegex = new RegExp('##\$P= .+');
   //var myRegex = new RegExp('##\$P= .+?')//[\s\S]", "m");       
   var filename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\procData\\woundClosureRandD\\AC_2023_291\\AC_2023_291_3974895\\10\\acqus";
   //var filename = "C:\\Users\\rpotter1\\OneDrive - JNJ\\Documents\\NMR\\macroWork\\testScrape.txt";
   //var oldString = "C:/give/me/a/brake/no/1/cares.txt";
   print(pScrapeNextLine(myRegex1, myRegex2, filename));
   //print(myRegex.exec(multiline));
   //print(pConvertPathToWindows(oldString));
}