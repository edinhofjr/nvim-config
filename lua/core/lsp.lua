vim.lsp.enable({"lua_ls"})

vim.diagnostic.config({
    virtual_lines = true,
    underline = true,
})

vim.lsp.config("*", {
    root_dir = vim.fn.getcwd()
})

