require "kyuromu"

local tw = Tween.new(8,"linear",function(i)
	io.write(tostring(i).."\n")
end)

tw:play()