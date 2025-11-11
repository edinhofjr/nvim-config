---require("core.options")
require("core.lsp")

vim.api.nvim_create_user_command(
	"Map",
	function() Map() end,
	{}
)
