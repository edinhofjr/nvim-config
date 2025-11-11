local M = {}
local keymaps = require("keymap_module.core")

M.setup = function(opts)
  	if opts.modules then
		for _, value in ipairs(opts.modules) do
			local i = require("keymap_module.plugins." .. value)
			for _, v in ipairs(i) do
				vim.keymap.set(v.mode, v.lhs, v.rhs, v.opts)
			end
		end
	end

	for _, map in ipairs(keymaps) do
		vim.keymap.set(
			map.mode,
			map.lhs,
			map.rhs,
			map.opts
		)
	end
end

return M
