local M = {}

-- Cria e exibe o buffer scratch
local function open_scratch()

    -- Deleta o buffer atual (0 = current)
  vim.api.nvim_buf_delete(0, { force = true })

  -- Cria novo buffer não listado (scratch)
  local buf = vim.api.nvim_create_buf(false, true)

  -- Define opções
  vim.api.nvim_buf_set_name(buf, "GreeterScratch")
  vim.api.nvim_buf_set_option(buf, "filetype", "greeter")
  vim.api.nvim_buf_set_option(buf, "modifiable", true)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "swapfile", false)

  -- Define o conteúdo
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    "======================================",
    "          👋 Bem-vindo ao Neovim",
    "======================================",
    "",
    " - Este é um buffer scratch",
    " - Não é listado (:ls não mostra)",
    " - Fecha automaticamente quando sair",
  })

  -- Usa o novo buffer na janela atual
  vim.api.nvim_set_current_buf(buf)

  -- Atalhos locais
  local opts = { buffer = buf, noremap = true, silent = true }
  vim.keymap.set("n", "q", "<cmd>bd!<CR>", opts)
    
  print("✅ Buffer scratch criado:", buf)
end

M.setup = function(opts)
  opts = opts or {}
    
  print("teste")
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      -- Garante que só executa se o Neovim abriu sem arquivos
      if vim.fn.argc() == 0 then
        vim.schedule(open_scratch)
      end
    end,
  })
end

return M

