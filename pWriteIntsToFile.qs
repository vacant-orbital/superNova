function pWriteIntsToFile(intArray, filename)	
	{
		var txt = File(filename);	
		var txtStm = TextStream(txt);
		txt.open(2); // parameter is open mode 1) readonly 2) overwrites 3) overwrites 4) append
		for(var ii = 0; ii < intArray.length; ii++)
			{
				for(var jj = 0; jj < intArray[ii].length; jj++)
				{				
					txtStm.write(intArray[ii][jj], "    ");	
				}
				txtStm.writeln("");
			}
		txt.close();
	}	