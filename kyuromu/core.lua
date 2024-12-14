-- check for custom errors
function cfcerror(args,values)
	-- errors presets
	local errors={
		["293"]="bad arguments values (%s = %s but expected: %s)",
		["294"]="nil argument required (%s = %s but expected: %s)"
	}
	local function giveerr(id)
		cfcerror({["id"] = id},{["id"] = "number"})
		local errstr=string.format("err: %d | ",id)
		return errstr..errors[tostring(id)]..'\n'
	end
	-- going trough all args
	local founderr=false
	for k,v in pairs(args) do
		for k1,t in pairs(values) do
			-- include there any checks (inside if statement)
			if k==k1 then
				if type(v)~=t and v~="null" then
					io.write(string.format(giveerr(293),tostring(k),tostring(type(v)),tostring(t)))
					founderr=true
				end
				if v=="null" then
					io.write(string.format(giveerr(294),tostring(k),"nil",tostring(t)))
					founderr=true
				end
			end
		end
	end
	-- check if args passed check
	return not founderr
end
