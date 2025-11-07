local M = {}

M.test = function()
    vim.api.nvim_create_user_command(
        "Test",
        "checkhealth Test",
        {}
    )
end

return M
