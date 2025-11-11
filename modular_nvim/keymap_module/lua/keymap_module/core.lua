local Keymap = require("keymap_module.keymap")

return {
  Keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "Save" }),
  Keymap("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit" }),
  Keymap("n", "<C-h>", "<C-w>h", { desc = "Move focus to left window", noremap = true }),
  Keymap("n", "<C-j>", "<C-w>j", { desc = "Move focus to window below", noremap = true }),
  Keymap("n", "<C-k>", "<C-w>k", { desc = "Move focus to window upper", noremap = true }),
  Keymap("n", "<C-l>", "<C-w>l", { desc = "Move focus to right window", noremap = true }),
  Keymap("n", "tl", function() vim.cmd("tabnew") end, { desc = "Open new tab" }),
  Keymap("n", "tq", "<cmd>tabclose<CR>", { desc = "Close current tab" }),
  Keymap("n", "<C-2>", "<cmd>tabn 2<CR>", { desc = "Go to second tab" }),

  Keymap("v", "<C-c>", '"+y', { desc = "Copy selected text" }),
  Keymap("v", "<S-Tab>", "<<", { desc = "Unindent selected text" }),
  Keymap("v", "<Tab>", ">>", { desc = "Indent selected text" }),
}
