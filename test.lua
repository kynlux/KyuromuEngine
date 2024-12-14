require "kyuromu"

local tw = Tween.new(8,enum.twstyle.fmend,function(i)
	io.write(tostring(i).."\n")
end)

tw:play()