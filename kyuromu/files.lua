-- get file
function getfile(fpath,foway)
	fpath=fpath or "null"
	foway=foway or "r"
	if not cfcerror({["fpath"]=fpath},{["fpath"]="string"}) then return end
	local f={
		_file=io.open(fpath,foway),
		get=function() return f._file end,
		close=function() f._file:close() end
	}
	return f
end
