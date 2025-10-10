# Just to use "ensure_installed" for Mason Plugin
return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
        ensure_installed = {
            "lua-language-server",
            "gopls"
        }
    }
}
