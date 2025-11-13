local M = {}

---@class LspOpts
---@field ensure_installed? Languages[]

M.installed_lsp = {}

M.states = {
	root_dir = vim.fn.getcwd()
}

M.language_lsp = {
	["go"] = "gopls",
	["lua"] = "lua_ls",
	["c"] = "clangd",
	["php"] = "phpactor",
	["json"] = "jsonls"
}

M.language_mason = {
	["lua"] = "lua-language-server",
	["json"] = "json-lsp"
}

M.language_mason = vim.tbl_extend('force', M.language_lsp, M.language_mason)

---@param opts LspOpts
M.setup = function(opts)
  opts = opts or {}

  local success, mr = pcall(require, "mason-registry")
  if not success then
    vim.notify("ERROR: mason is not installed", vim.log.levels.ERROR)
    return
  end

  local installed_lsps = {}

  if type(opts.ensure_installed) ~= "table" then
    return
  end

  for _, language in pairs(opts.ensure_installed) do
    local package = mr.get_package(M.language_mason[language])

    if not package:is_installed() then
      package:install()
    end

    table.insert(installed_lsps, M.language_lsp[language])
  end

  M.installed_lsp = installed_lsps

  vim.lsp.enable(installed_lsps)

  M.setup_cmds()
  M.setup_events()
end

M.setup_cmds = function()
  	vim.api.nvim_create_user_command("LspStatus", "checkhealth vim.lsp", {})
	vim.api.nvim_create_user_command("LspRestart", M.restart_lsp, {})
end

M.setup_events = function()
	vim.api.nvim_create_autocmd("DirChanged", {
		callback = function(ev)
			print(vim.inspect(ev))
			M.states["root_dir"] = ev.file
		end
	})
end

M.restart_lsp = function()
	local names = vim.iter(vim.lsp.get_clients()):map(function(c) return c.name end):totable()
    print(vim.inspect(names))
end

return M

