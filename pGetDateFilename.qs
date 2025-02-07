/*  
20Jun2022 rgpotter
This module gets the date and filename via MestReNova getParameter() strategy.
*/
function pGetDateFilename(aSpectrum)// anAqDate, aProcDate, aFilename)
{
// some regex stuff for finding the date, original file path, etc.
    var usbFile = aSpectrum.getParam("Data File Name"); //this is the path of the file from where you opened it from (most likely usb or local file path)
    var myRegexp1 = /auto_.*/; //just use part of the usb path after /auto_
    var match1 = myRegexp1.exec(usbFile);
    var str1 = "/home/Walkup/vnmrsys/Automation/"; //this string preceeds /auto_ on the host computer path
    var hostDir = str1.concat(match1);
    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    // Get the aquisition date and time from timestamp and format
    var myRegexp2 = /([^T]+)/;
    var aqDate = aSpectrum.getParam("Acquisition Date");
    print(aqDate);
    var match2 = aqDate.match(/([^T]+)/);
    var match3 = aqDate.match(/[^T]*$/);
    var dt = '' + match2[0];
    var parts =dt.split('-');
    var myDate = new Date(parts[0], parts[1] - 1, parts[2]); 
    var add = String(myDate.getDate());
    var amm = String(months[myDate.getMonth()]);
    var ayyyy = myDate.getFullYear();
    myDate = amm + ' ' + add + ', ' + ayyyy;        				

    // use todays date as the process date
    var today = new Date();
    var dd = String(today.getDate());
    //var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var mm = String(months[today.getMonth()]);
    var yyyy = today.getFullYear();
    today = mm + ' ' + dd + ', ' + yyyy;    
    return([myDate, today, hostDir]);         	
}