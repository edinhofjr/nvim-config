local pathman = {}

pathman.add = function(path)
    local current_path = vim.env.PATH or ""
    vim.env.PATH = path .. ":" .. current_path
    print(vim.env.PATH)
end

return pathman
