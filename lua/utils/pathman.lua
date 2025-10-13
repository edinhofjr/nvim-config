local pathman = {}

pathman.add = function(path)
    vim.fn.setenv("PATH", path .. ":" .. vim.fn.getenv("PATH"))
end

return pathman
