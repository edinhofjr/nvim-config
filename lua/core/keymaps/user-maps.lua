return {
    ["n"] = {
        ["<C-s>"] = {
            '<cmd> w <CR>', {
                desc = "Save"
            }
        },
        ["<C-q>"] = {
            '<cmd> q <CR>', {
                desc = "Quit"
            }
        },
        ["<C-h>"] = {
            '<C-w>h', {
                desc = "Move focus to left window",
                noremap = true
            }
        },
        ["<C-j>"] = {
            '<C-w>j', {
                desc = "Move focus to window below",
                noremap = true
            }
        },
        ["<C-k>"] = {
            '<C-w>k', {
                desc = "Move focus to window upper",
                noremap = true
            }
        },
        ["<C-l>"] = {
            '<C-w>l', {
                desc = "Move focus to right window",
                noremap = true
            }
        },
        ["tl"] = {
                function() vim.cmd("tabnew") end, {
                desc = "Move focus to left tab"
            }
        },
        ["tq"] = {
            "<cmd> tabclose <CR>", {
                desc = "Close atual tab"
            }
        },
        ["<C-2>"] = {
            "<cmd> tabn 2 <CR>", {
                desc = "Move focus to second tab"
            }
        }
    },
    ["v"] = {
        ["<C-c>"] = {
            '"+y', {
                desc = "Copy selected text"
            }
        },
        ["<S-Tab>"] = {
            '<<', {
                desc = "Unindent selected text"
            }
        },
        ["<Tab>"] = {
            '>>', {
                desc = "Indent selected text"
            }
        }
    },
}
