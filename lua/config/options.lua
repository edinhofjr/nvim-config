-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options

local path = {
  "cwd",
  "build",
  "run",
}

for _, value in pairs(path) do
  local t = require("config.custom." .. value)
  vim.api.nvim_create_user_command(t.name, t.callback, t.opt)
end
