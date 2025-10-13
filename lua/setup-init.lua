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

    for mode, bind in pairs(mod) do
        for key, cb in pairs(bind) do
            local success, err = pcall(
                function()
                    vim.keymap.set(mode, key, cb[1], cb[2])
                end
            )
            if not success then
                print("ERROR: invalid binding on MODE: " .. mode .. " KEYS: " .. key .. " " .. err)
            end
        end
    end
end

