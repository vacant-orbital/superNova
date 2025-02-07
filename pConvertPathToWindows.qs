//This one is for using the newString path later in the program (eg. to open a file)
//for printing a windows style path use function pConvertUnixPathToWindows
function pConvertPathToWindows(astring)
{
    var newString = "";
    var chr;
    for (chr = 0; chr < astring.length; chr++) 
    {
        if(astring.charAt(chr)=="/")
        {
            newString = newString + "\\\\";
        }                       
        else
        {
            //print(astring.charAt(chr));
            newString = newString + astring.charAt(chr);
        }
        //print(newString)
    }
    return newString;
}  