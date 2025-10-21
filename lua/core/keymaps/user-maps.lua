return {
    -- Normal mode
    { modes = "n", trigger = "<C-s>", action = "<cmd>w<CR>", opts = { desc = "Save" } },
    { modes = "n", trigger = "<C-q>", action = "<cmd>q<CR>", opts = { desc = "Quit" } },
    { modes = "n", trigger = "<C-h>", action = "<C-w>h", opts = { desc = "Move focus to left window", noremap = true } },
    { modes = "n", trigger = "<C-j>", action = "<C-w>j", opts = { desc = "Move focus to window below", noremap = true } },
    { modes = "n", trigger = "<C-k>", action = "<C-w>k", opts = { desc = "Move focus to window upper", noremap = true } },
    { modes = "n", trigger = "<C-l>", action = "<C-w>l", opts = { desc = "Move focus to right window", noremap = true } },
    { modes = "n", trigger = "tl", action = function() vim.cmd("tabnew") end, opts = { desc = "Open new tab" } },
    { modes = "n", trigger = "tq", action = "<cmd>tabclose<CR>", opts = { desc = "Close current tab" } },
    { modes = "n", trigger = "<C-2>", action = "<cmd>tabn 2<CR>", opts = { desc = "Go to second tab" } },

    -- Visual mode
    { modes = "v", trigger = "<C-c>", action = '"+y', opts = { desc = "Copy selected text" } },
    { modes = "v", trigger = "<S-Tab>", action = "<<", opts = { desc = "Unindent selected text" } },
    { modes = "v", trigger = "<Tab>", action = ">>", opts = { desc = "Indent selected text" } },
}
