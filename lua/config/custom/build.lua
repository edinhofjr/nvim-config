local scan = require("plenary.scandir").scan_dir
local utils = require("./../../utils/utils")

local function cmake()
  local root = vim.fn.getcwd()

  local opts = {
    hidden = false,
    search_pattern = "CMakeLists.txt",
  }

  local res = scan(root, opts)
  local size = utils.table.lenght(res)

  if size == 0 then
    print("Nenhum CMakeLists.txt encontrado!")
    return
  elseif size > 2 then
    print("Mais de um CMakeLists.txt encontrado!")
    utils.table.print(res)
    return
  end

  print("Usando CMakeLists: " .. res[1])
  print("Criando Build!")
  local buildpath = root .. "/" .. "build"
  vim.fn.mkdir(buildpath, "p")

  vim.cmd("cd " .. buildpath)
  vim.fn.system("cmake ..")
  vim.cmd("cd " .. buildpath)
  vim.cmd("make")
  vim.cmd("cd " .. root)
end

return {
  name = "Build",
  callback = cmake,
  opt = {
    desc = "Build Cpp Project",
  },
}
