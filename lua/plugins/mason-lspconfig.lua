# Just to use "ensure_installed" for Mason Plugin
return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "lua_ls",
            "gopls",
        }
    }
}
