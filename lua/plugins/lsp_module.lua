---@type LazyPluginSpec
return {
    dir = vim.fn.stdpath("config") .. "/lua/lsp_module",
    dev = true,
    dependencies = {
        "mason-org/mason.nvim"
    },
    ---@type LspOpts
    opts = {
        ensure_installed = {
            "lua",
            "c"
        }
    },
}

