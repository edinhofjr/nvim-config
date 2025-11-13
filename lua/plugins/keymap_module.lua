---@type LazyPluginSpec
return {
	dir = "~/.config/nvim/modular_nvim/keymap_module/",
	opts = {
		modules = {
			"neo-tree"
		}
	},
	dependencies = {
		"folke/which-key.nvim"
	},
	event = "VeryLazy"
	---enabled = false
}
