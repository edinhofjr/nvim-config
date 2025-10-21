require("core.options")
require("core.lsp")

local sc = require("plenary.scandir")

local folders = sc.scan_dir(vim.fn.stdpath("config") .. "/lua/core/keymaps")

---@param module string Caminho do módulo, ex: "config.keymaps"
local load_keymaps = function(module)
  print(module)
  local ok, keymaps = pcall(require, module)
  if not ok then
    vim.notify("Erro ao carregar keymaps: " .. tostring(keymaps), vim.log.levels.ERROR)
    return
  end

  print(keymaps, ok)
  if type(keymaps) ~= "table" then
    vim.notify("O módulo '" .. module .. "' não retornou uma tabela válida de keymaps.", vim.log.levels.WARN)
    return
  end

  for _, map in ipairs(keymaps) do
    local modes = map.modes or "n"
    local trigger = map.trigger
    local action = map.action
    local opts = map.opts or {}

    if not trigger or not action then
      vim.notify("Keymap inválido detectado (faltando trigger ou action)", vim.log.levels.WARN)
    else
      vim.keymap.set(modes, trigger, action, opts)
    end
  end
end

for _, file in pairs(folders) do
    local ii, _ = string.find(file, "core")

    local modr = file
        :sub(ii)
        :gsub(".lua", "")
        :gsub("/", ".")

    load_keymaps(modr)
end
