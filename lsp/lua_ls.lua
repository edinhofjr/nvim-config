return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dir = vim.fn.getcwd(),
  settings = {
    Lua = {
        diagnostics = {
            globals = { "vim" }
        },
      workspace = {
        library = {
            vim.fn.stdpath "config" .. "/nvim/lua",
            vim.fn.stdpath "data" .. "/lazy"
        },
        checkThirdParty = false,
    },
    },
  },
}

