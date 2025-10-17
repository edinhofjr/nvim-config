local t = require("utils.table_manip")
print("loaded-module")
local M = {}

---@alias Languages "c" |"cpp" | "javascript" | "lua" | "go" 

---@type table<Languages, string>
local language_lsp = {
    ["go"] = "gopls",
    ["lua"] = "lua_ls",
    ["cpp"] = "clangd",
}

local language_mason = {
    ["lua"] = "lua-language-server",
}

language_mason = t.dict_merge(language_lsp, language_mason)

---@class opts
---@field ensure_installed? Languages[]

---@param opts opts
M.setup = function(opts)
    local success, mr = pcall(require, "mason-registry")

    if not success then
        vim.notify("ERROR: mason is not installed")
        return
    end

    local installed_lsps = {}

    for _, language in pairs(opts.ensure_installed) do
        local package = mr.get_package(language_mason[language])

        if not package:is_installed() then
            package:install()
        end

        table.insert(installed_lsps, language_lsp[language])
    end

    vim.lsp.enable(
        t.values(installed_lsps)
    )
end

return M
