require("core.keymaps")
require("core.options")
require("core.lsp")

local sc = require("plenary.scandir")

local folders = sc.scan_dir(vim.fn.stdpath("config") .. "/lua/core/keymaps")

for _, file in pairs(folders) do
    local ii, _ = string.find(file, "core")

    local modr = file
        :sub(ii)
        :gsub(".lua", "")

    local mod = require(modr)

    for _, t in pairs(mod) do
        vim.keymap.set(t[1], t[2], t[3], t[4])
    end
end

