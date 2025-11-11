local functional = {}

functional.map = function(array, fn)
	local narray = {}

	for k, v in ipairs(array) do
		table.insert(narray, fn(k, v, array))
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
