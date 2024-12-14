-- display table
function displayt(t,tlv)
	t=t or "null"
	tlv=tlv or 0
	if not cfcerror({["t"]=t},{["t"]="table"}) then return end
	for k,v in pairs(t) do 
		-- tab space
		io.write(string.rep(" ",tlv*2))
		if type(v)=="table" then
			io.write(tostring(k)..": {".."\n")
			displayt(v,tlv+1)
			io.write(string.rep(" ",tlv*2).."}".."\n")
		else io.write(tostring(k).." -> "..tostring(v).."\n") end
	end
end
-- loading bar
function lbar(t,len)
	t=t or "null"
	len=len or 10
	if not cfcerror({["t"]=t},{["t"]="number"}) then return end
	io.write("loading.. [")
	for i=1,len do
		io.write("#")
		sleep(t/len)
	end
	io.write("] Done!")
end
