---@type LazyPluginSpec
return {
    "edinhofjr/lsp_module",
    dev = true,
    dependencies = {
        "mason-org/mason.nvim", "edinhofjr/lsp_module"
    },
    ---@type LspOpts
    opts = {
        ensure_installed = {
            "lua",
            "json",
	    "php"
        }
    },
}

