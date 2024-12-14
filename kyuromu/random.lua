-- new random seed
function nrndseed(cseed)
	cseed=cseed or "null"
	if not cfcerror({["cseed"]=cseed},{["cseed"]="number"}) then return end
	math.randomseed(cseed)
end
-- random
function rnd(mn,mx)
	mn=mn or "null"
	mx=mx or "null"
	if mx=="null" and mn>0 then mx=mn mn=0 end
	if not cfcerror({["mn"]=mn,["mx"]=mx},{["mn"]="number",["mx"]="number"}) then return end
	nrndseed(os.clock()^5)
	return math.random(mn,mx)
end
-- random string
function rndstr(len,blw,cseed)
	len=len or "null"
	blw=blw or {}
	cseed=cseed or os.clock()^5
	if not cfcerror({["len"]=len},{["len"]="number"}) then return end
	nrndseed(cseed)
	local res=""
	local symbols="qwertyuiopasdfghjklzxcvbnm,./;'[]\"\\|{}()*&^%$#@!"
	for i=1,len do
		local chari=math.random(1, #symbols)
		local char=string.sub(symbols, chari, chari)
		-- with 50% make character uppercase
		char=math.random(1,2)==1 and char or string.upper(char)
		res=res..char
	end
	return res
end
