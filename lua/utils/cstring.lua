local cstring = {}
cstring.__index = cstring

function cstring.new(str)
    local self = setmetatable({}, cstring)
    self.value = str or ""
    return self
end

function cstring:set(str)
    self.value = str
    return self
end

function cstring:get()
    return self.value
end

function cstring:append(str)
    self.value = self.value .. str
    return self
end

function cstring:prepend(str)
    self.value = str .. self.value
    return self
end

function cstring:toUpper()
    self.value = string.upper(self.value)
    return self
end

function cstring:toLower()
    self.value = string.lower(self.value)
    return self
end

function cstring:trim()
    self.value = self.value:match("^%s*(.-)%s*$")
    return self
end

function cstring:replace(pattern, replacement)
    self.value = self.value:gsub(pattern, replacement)
    return self
end

function cstring:split(separator)
    local result = {}
    for part in self.value:gmatch("([^" .. separator .. "]+)") do
        table.insert(result, part)
    end
    return result
end

function cstring:print()
    print(self.value)
    return self
end

function cstring:remove_before(pattern)
    local start_pos, _ = self.value:find(pattern)
    if start_pos then
        self.value = self.value:sub(start_pos)
    end

    return self
end

return cstring

