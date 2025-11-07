local M = {}

---@param opts Opts
M.setup = function(opts)
    assert(opts)
    M.draw()

    vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        nested = true,
        callback = function()
            vim.api.nvim_create_user_command("Greet", function()
                print("Greeting")
            end, {})
        end,
    })
end

M.state = {}

M.style = function(win, buf)
    local set_option = vim.api.nvim_set_option_value
    set_option("fillchars", "eob: ", {win = win})
    set_option("number", false, {win = win})
end

M.draw = function()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_win_set_buf(win, buf) -- associa antes de mudar opções

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "teste" })

    vim.schedule(function() M.style(win, buf) end)
    M.state = {
        line = 0,
        buffer = buf,
        windows = { win },
        win_width = 0,
        open = false,
    }
end

return M
