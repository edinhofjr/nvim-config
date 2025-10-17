return {
    dir = vim.fn.stdpath "config" .. "/lua/lspconfigurator",
    dependencies = {
        "mason-org/mason.nvim"
    },
    ---@type opts
    opts = {
        ensure_installed = {
            "lua",
            "go",
            "cpp"
        }
    }
}
