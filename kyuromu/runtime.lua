-- sleep/wait function
function sleep(t)
	t=t or "null"
	if not cfcerror({["t"]=t},{["t"]="number"}) then return end
	local nl=os.clock()+t
	while os.clock()<nl do end
	-- return true to show sleep time is ended
	return true
end
-- test callback performance
--[[ 
its VERY unoptimized and reccomend to use ONLY if you want test execution time of hard function
its executes your callback function 25k times and records every execution time, its might take a while to get actual execution time
]]
function tcbprfm(cb,mul)
	cb=cb or "null"
	mul=mul or 1
	if not cfcerror({["cb"]=cb},{["cb"]="function"}) then return end
	local ttak={}
	for i=1,25000*mul do
		local be=os.clock()
		cb()
		table.insert(ttak, os.clock()-be)
	end
	local tt=0
	for k,v in pairs(ttak) do
		tt=tt+tonumber(v)
	end
	io.write("function performance is "..tostring(tt/#ttak).."s")
	return tt/#ttak
end