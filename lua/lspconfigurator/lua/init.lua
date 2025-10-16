local t = require("utils.table_manip")
local M = {}

---@alias languages     '"c" |"cpp" | "javascript" | "lua" | "go" 

---@type table<languages, string>
local language-lsp = {
    ["go"] = "gopls",
    ["lua"] = "lua_ls",
    ["cpp"] = "clangd",
}

local language-mason = {
    ["lua"] = "lua-language-server",
}

language-mason = t.merge(language-lsp, language-mason)

---@class opts
---@field ensure_installed? languages[]

---@param opts opts
M.setup = function(opts)
    local success, mr = pcall(require, "mason-registry")

    if not success then
        vim.notify("ERROR: mason is not installed")
        return
    end

    installed_lsps = {}

    for _, language in pairs(opts.ensure_installed) do
        local package = mr.get_package(language-mason)
        
        if not package:is_installed() then
            package:install()
        end

        table.insert(installed_lsps, lsp_name)
    end

    vim.lsp.enable(
        t.values(installed_lsps)
    )
end

return M
