---@type LazyPluginSpec
return {
    dir = vim.fn.stdpath("config") .. "/lua/lspconfigurator",
    dev = true,

    ---@type LspConfiguratorOpts
    opts = {
        ensure_installed = {
            "lua",
            "c"
        }
    },
}

