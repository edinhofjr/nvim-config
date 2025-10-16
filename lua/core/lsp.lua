local table_m = require("utils.table_manip")

vim.diagnostic.config({
    virtual_lines = true,
    underline = true,
})

vim.lsp.config("*", {
    root_dir = vim.fn.getcwd()
})

