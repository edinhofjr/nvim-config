---@param mode KeymapModes
---@param lhs KeymapTrigger
---@param rhs KeymapAction
---@param opts KeymapOptional
---@return KeymapBinding
return function(mode, lhs, rhs, opts)
	return {
		mode = mode,
		lhs = lhs,
		rhs = rhs,
		opts = opts
	}
end
