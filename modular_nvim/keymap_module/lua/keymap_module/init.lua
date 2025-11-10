local M = {}

M.setup = function()
	---@type KeymapBinding[]
	local keymaps = require("keymaps_module.core")

	for _, map in ipairs(keymaps) do
		vim.keymap.set(
			map.modes,
			map.trigger,
			map.action,
			map.opts
		)
	end
end

return M
