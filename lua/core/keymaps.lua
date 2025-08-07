vim.g.mapleader = ' '
vim.g.maplocalleader= ' '

vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }
local keyset = vim.keymap.set

local kset = function(modes, lhs, rhs)
    keyset(modes, lhs, rhs, opts)
end

-- Salvar
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Fechar
keyset('n', '<C-q>', '<cmd> q <CR>', opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

keyset('n', 'n', 'nzzzv', opts)
keyset('n', 'N', 'Nzzzv', opts)

-- Copiar com Ctrl+C
keyset('v', '<C-c>', '"+y', opts)

-- Movimentar entre buffers
keyset('n', '<C-h>', '<C-w>h', opts)
keyset('n', '<C-j>', '<C-w>j', opts)
keyset('n', '<C-k>', '<C-w>k', opts)
keyset('n', '<C-l>', '<C-w>l', opts)

-- Movimentar entre tabs


-- Identação -----------------------------------
-- Recuar
kset({'v','n'}, '<S-Tab>', "<gv")
kset('i', '<S-Tab>', '<Esc><<a')
-- Avançar
kset('v', '<Tab>', ">gv")

-- Desfazer
kset('n', '<C-z>', "u")
kset('i', '<C-z>', "<Esc>ua")

vim.opt.cursorline   = true
vim.opt.scrolloff    = 10
vim.opt.expandtab    = true     -- False: \t | True: " "
vim.opt.smartindent  = true
vim.opt.autoindent   = true
vim.opt.ignorecase   = true
vim.opt.smartcase    = true     -- case sensitive if uppercase in search
vim.opt.incsearch    = true


-- Neo-tree

local neotreemap = {
    kset('n', '<leader>e', ':Neotree toggle position=left<CR>', opts)
}


