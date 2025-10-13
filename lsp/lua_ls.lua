return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
        runtime = {
            version = "LuaJIT"
        },
        diagnostics = {
            globals = { "vim" }
        },
      workspace = {
        library = {
            vim.fn.stdpath "config" .. "/nvim/lua", -- user defined functions lua
            vim.fn.stdpath "data" .. "/lazy", -- plugins lua
            vim.env.VIMRUNTIME
        },
        checkThirdParty = false,
    },
    },
  },
}

