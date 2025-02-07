//This one is for printing a windows style path to stdout or a text page item
//for using the newString path later in the program (eg. to open a file) use function pConvertPathToWindows
function pConvertUnixPathToWindows(astring)
{
    var newString = "";
    var chr;
    for (chr = 0; chr < astring.length; chr++) 
    {
        if(astring.charAt(chr)=="/")
        {
            newString = newString + "\\";
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