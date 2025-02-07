//version 1.0 -- potter 12May2021
// Puts a parameters section on the spectrum that emulates the old school Varian parameter format

function pLabel()
{
var w = new DocumentWindow(Application.mainWindow.activeWindow());
//var spec = new NMRSpectrum(nmr.activeSpectrum());
var spec = new NMRSpectrum(nmr.activeSpectrum()), _f = spec.getProperty("axes.font");
_f.bold = true;
spec.setProperty("curve.color", "black");
spec.setProperty("curve.linewidth", 4);
spec.setProperty("title.visible", true);
spec.setProperty("title.format", "Data File Name: {parm, \x22Data File Name\x22}{br}"); // "\x22" codes for double quotes    
spec.setProperty("grid.showHorizontal", false);
spec.setProperty("axes.horizontal.label", "ppm");
spec.setProperty("grid.showVertical", false);
spec.setProperty("axes.vertical.visible", false);
spec.setProperty("integrals.curve.margin", 96);
spec.setProperty("integrals.curve.color", "#000000");  // hex for black
spec.setProperty("integrals.label.margin", 0);  //changed from -2
spec.setProperty("integrals.label.color", "#000000");
spec.setProperty("integrals.label.font", "MS Shell Dlg 2"); //MS Shell Dlg 2, 24
//spec.setProperty("integrals.label.font.size", "12"); //MS Shell Dlg 2, 24
spec.setProperty("axes.font", _f);	

var p = spec.proc;

spec.update();



//spec.process(p);

// some regex stuff for finding the date, original file path, etc.
var usbFile = spec.getParam("Data File Name"); //this is the path of the file from where you opened it from (most likely usb or local file path)
var myRegexp1 = /auto_.*/; //just use part of the usb path after /auto_
var match1 = myRegexp1.exec(usbFile);
var str1 = "/home/Walkup/vnmrsys/Automation/" //this string preceeds /auto_ on the host computer path
var hostDir = str1.concat(match1);
var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

// Get the aquisition date and time from timestamp and format
var myRegexp2 = /([^T]+)/;
var aqDate = spec.getParam("Acquisition Date");
print(aqDate);
var match2 = aqDate.match(/([^T]+)/);
var match3 = aqDate.match(/[^T]*$/)
dt = '' + match2[0];
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

// split the comment into 3 variables to fool html
// description below into treating newline character correctly
var str3 = spec.getParam("Comment").split("\n");


//Build a parameter box as a html table
var params ="<html><body><table border=\"0\" frame=\"border\">";
params += "<tr><td>Comment: </td><td>"// + str2 + "</td></tr>";
for (i=0; i < str3.length; i++)
{
	params += "<tr><td></td><td>" + str3[i] + "</td></tr>";
}

params += "<tr><td>Spectrometer: </td><td>" + spec.getParam("Origin") + " " + Math.round(spec.getParam("Spectrometer Frequency")) + " MHz VNMRS" + "</td></tr>";
params += "<tr><td>Solvent: </td><td>" + spec.getParam("Solvent") + "</td></tr>";
params += "<tr><td>Temperature: </td><td>" + spec.getParam("Temperature") + " C" + "</td></tr>";
params += "<tr><td>Reveiver Gain: </td><td>" + spec.getParam("Receiver Gain") + "</td></tr>";
params += "<tr><td>Number of Scans: </td><td>" + spec.getParam("Number of Scans") + "</td></tr>";
params += "<tr><td>Relaxation Delay: </td><td>" + spec.getParam("Relaxation Delay") + "</td></tr>";
params += "<tr><td>Acq. Time (sec): </td><td>" + round(spec.getParam("Acquisition Time"), 3) + "</td></tr>";
params += "<tr><td>Acquisition Date: </td><td>" + myDate + " " + match3 + "</td></tr>";
params += "<tr><td>Pulse Width</td><td>" + round(spec.getParam("Pulse Width"), 2) + "</td></tr>"; //jp 8/21/2019 changed from: spec.getParam("PW(45)")
params += "<tr><td>Spectrometer Frequency</td><td>" + round(spec.getParam("Spectrometer Frequency"), 2) + "</td></tr>";
params += "<tr><td>Spectral Width</td><td>" + round(spec.getParam("Spectral Width"), 2) + "</td></tr>";
params += "<tr><td>Nucleus</td><td>" + spec.getParam("Nucleus") + "</td></tr>";
params += "<tr><td></td><td>" + "</td></tr>";
params += "<tr><td>Processed " + today + " using MestReNova </td></tr>"
params += "<tr><td></td><td>" + "</td></tr>";



//draw the parameter box and hostpath similar to the varian macro 
var par = draw.text("<font style=\"font-size: 8pt; font-family: Arial\">" + params +"<\font>", 
							"Report Special", "Params", true);  // second and third parameters are type and subtype properties of the text object
																		
//move the directory label to the bottom of the page
//dirLabel.translate(0, 198);


//spec.fitToHighestCompound();
spec.update();
//update the window with cahnges made above
mainWindow.activeWindow().update();

//javascript doesnt have a round to precision function
//Math.round builtin rounds to nearest integer
function round(value, precision) {
    var multiplier = Math.pow(10, precision || 0);
    return Math.round(value * multiplier) / multiplier;
}    
}
