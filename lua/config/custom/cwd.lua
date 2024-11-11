vim.api.nvim_create_user_command("Cwd", function()
  print(vim.fn.getcwd())
end, {
  desc = "Print CWD",
})

return {
  name = "Cwd",
  callback = function()
    print(vim.fn.getcwd())
  end,
  opt = {
    desc = "Print CWD",
  },
}
