function pFilePathChopper(filepath)
{
	//strList = filepath.split("\\")
	strList = filepath.split("/")
	/*
	for (var i = 0; i < strList.length; i++)
	{
		print(strList[i]);
	}
	*/
	newPath = "/" + strList[strList.length - 3] + "/" + strList[strList.length - 2] + "/" + strList[strList.length - 1]
	return newPath
}