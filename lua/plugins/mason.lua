local pm = require("utils.pathman")

local LSP_MASON_FOLDER = vim.fn.stdpath "data" .. "/mason/bin"
return {
    "mason-org/mason.nvim",
    init = function (_)
        pm.add(LSP_MASON_FOLDER)
    end,
    opts = {},
}
