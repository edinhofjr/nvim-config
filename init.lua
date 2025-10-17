vim.api.nvim_create_autocmd({"DirChanged"}, {
  callback = function()
    print("CWD mudou para: " .. vim.loop.cwd())
    print(debug.traceback())  -- mostra quem chamou
  end
})

require("lazy-init")
require("setup-init")
