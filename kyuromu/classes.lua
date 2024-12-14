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
function Object.achild(self,child)
	self.childs[child]=child
	if child.name then child.parent=self end
end
function Object.parent(self,parent)
	self.parent=parent
	if parent.name then parent:achild(self) end
end
