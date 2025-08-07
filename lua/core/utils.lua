function assert_mode(mode, cmd_string, backup_previous)
  local last_mode = vim.fn.mode()

  local strats = {
    ["n"] = {
      ["cmd"] = "<Esc>"
    }
  }

  local cmd = (strats[mode] and strats[mode]['cmd'] or '') .. cmd_string

  -- Executa a sequência de teclas no Neovim
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(cmd, true, false, true),
    'n',  -- tipo de modo de entrada: normal
    false
  )
end

-- Mapeia no modo normal
vim.keymap.set('n', '<leader>d', function()
  assert_mode('n', '>>')
end)

