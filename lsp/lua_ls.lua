return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dir = vim.fn.getcwd(),
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
            os.getenv("VIMRUNTIME") -- builtin lua 
        },
        checkThirdParty = false,
    },
    },
  },
}

