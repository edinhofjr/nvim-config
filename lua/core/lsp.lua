local d = require("utils.debug")

vim.lsp.enable({
    "lua_ls"
})

vim.diagnostic.config({
    virtual_lines = true,
    underline = true,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end
})

vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "*",
  callback = function(_)
  end
})
