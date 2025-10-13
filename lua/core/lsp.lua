local table_m = require("utils.table_manip")

local languages = require("core.enabled_languages")

vim.lsp.enable(table_m.values(languages))

vim.diagnostic.config({
    virtual_lines = true,
    underline = true,
})

vim.lsp.config("*", {
    root_dir = vim.fn.getcwd()
})

