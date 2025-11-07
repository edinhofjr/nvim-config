local T = require("check_module.lib.test")
local M = {}

M.setup = function(opts)
    T.test()
    vim.api.nvim_create_user_command(
        "CheckHealth",
        "checkhealth Lazy",
        {}
    )
end

return M
