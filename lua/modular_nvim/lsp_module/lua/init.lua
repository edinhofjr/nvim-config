local t = require("utils.table_manip")
local M = {}
local LC_TYPES = require("modular_nvim.lsp_module.types")

---@class LspOpts
---@field ensure_installed? Languages[]

M.installed_lsp = {}

---@param opts LspOpts
M.setup = function(opts)
  opts = opts or {} -- garante que não é nil

  M.on_dirchange()

  local success, mr = pcall(require, "mason-registry")
  if not success then
    vim.notify("ERROR: mason is not installed", vim.log.levels.ERROR)
    return
  end

  local installed_lsps = {}

  -- Se não tiver nenhuma linguagem configurada, apenas encerra
  if type(opts.ensure_installed) ~= "table" then
    return
  end

  -- Itera normalmente
  for _, language in pairs(opts.ensure_installed) do
    local package = mr.get_package(LC_TYPES.getMasonName(language))

    if not package:is_installed() then
      package:install()
    end

    table.insert(installed_lsps, LC_TYPES.getLSP(language))
  end

  M.installed_lsp = installed_lsps

  -- Ativa os LSPs instalados
  vim.lsp.enable(t.values(installed_lsps))

  M.on_init()
end

M.on_init = function()
  vim.api.nvim_create_user_command("LspStatus", "checkhealth vim.lsp", {})
end

M.on_dirchange = function()
  vim.api.nvim_create_autocmd("DirChanged", {
    callback = function()
      print(vim.fn.getcwd())
    end,
  })
end

return M

