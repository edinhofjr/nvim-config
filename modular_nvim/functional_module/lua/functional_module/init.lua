local functional = {}

---@generic T, R
---@param array T[]
---@param fn fun(value: T, index: number, array: T[]): R
---@return R[]
functional.map = function(array, fn)
	local narray = {}

	for k, v in ipairs(array) do
		table.insert(narray, fn(v, k, array))
	end

	return narray
end

---@generic T, R
---@param array T[]
---@param fn fun(value: T, index: number, array: T[]): boolean
---@return R[]
functional.filter = function(array, fn)
	local narray = {}

	for k, v in ipairs(array) do
		if fn(v, k, array) == true then
			table.insert(narray, v)
		end
	end

	return narray
end

local M = {}

local default = {
	global = true
}

M.setup = function(opts)
	opts = opts or default
	if opts.global then
		for k, v in pairs(functional) do
			_G[k] = v
		end
	end
end

return M
