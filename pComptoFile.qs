
function pComptoFile(acomp, afilename)
{
	var txt = File(afilename);
	txt.open(2); // parameter is open mode 1) read 2) overwrite 3) overwrite 4) append
	var txtStm = TextStream(txt);	
	for(var ii = 0; ii < acomp.length; ii++)
	{
		for(var jj = 0; jj < acomp[ii].length; jj++)
		{
			txtStm.write(acomp[ii][jj], "    ");	
		}
		txtStm.writeln("");
	}				  
	txtStm.write("\n");              
	txt.close();
}

/*
File.open() modes from manual: {File.Append, File.NotOpen, File.ReadOnly, File.ReadWrite, File.WriteOnly}
*/