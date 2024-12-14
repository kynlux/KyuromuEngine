-- initialize object
Object={}
Object.__index=Object
function Object.new(name,data,methods)
	name=name or "null"
	data=data or {}
	methods=methods or {}
	if not cfcerror({["name"]=name},{["name"]="string"}) then return end
	local self = setmetatable({}, Object)
	self.name=name
	self.parent="null"
	self.childs={}
	self.data=data
	self.methods=methods
	return self
end
-- attach child
function Object.achild(self,child)
	self.childs[child]=child
	if child.name then child.parent=self end
end
-- parent
function Object.parent(self,parent)
	self.parent=parent
	if parent.name then parent:achild(self) end
end

-- initializing tween
Tween={}
Tween.__index=Tween
function Tween.new(t,style,cd)
	t=t or "null"
	style=style or enum.twstyle.linear
	cd=cd or "null"
	if not cfcerror({["t"]=t,["style"]=style,["cb"]=cb},{["t"]="number",["style"]="string",["cb"]="function"}) then return end
	if string.upper(style)~="LINEAR" then io.write("every style expect \"Linear\" not supported but it still work as linear\nplease wait till new update") end
	local self = setmetatable({},Tween)
	self.t=t
	self.style=style
	self.cd=cd
	return self
end
-- play tween
function Tween.play(self)
	for i=1,0,-0.001 do
		self.cd(i)
		sleep(self.t/1000)
	end
end