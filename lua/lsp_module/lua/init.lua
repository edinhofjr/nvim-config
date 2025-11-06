local t = require("utils.table_manip")
local M = {}
local LC_TYPES = require("lsp_module.types")

---@class LspOpts
---@field ensure_installed? Languages[]

---@param opts LspOpts
M.setup = function(opts)
    local success, mr = pcall(require, "mason-registry")

    if not success then
        vim.notify("ERROR: mason is not installed")
        return
    end

    local installed_lsps = {}

    for _, language in pairs(opts.ensure_installed) do
        local package = mr.get_package(LC_TYPES.getMasonName(language))

        if not package:is_installed() then
            package:install()
        end

        table.insert(installed_lsps, LC_TYPES.getLSP(language))
    end

    vim.lsp.enable(
        t.values(installed_lsps)
    )
end

return M
