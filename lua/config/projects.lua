local projects = {}

projects.is_initialized = function()
  --Checar se existe a pasta de dados no ~/.local/share/nvim/
  --Caso não exista, cria uma.

  local PROJPATH = "/.local/share/nvim/projects/"
  local HOME = vim.fn.expand("~")
  local FULLPATH = HOME .. PROJPATH

  if vim.fn.isdirectory(FULLPATH) == 0 then
    local out = vim.fn.mkdir(FULLPATH)
    print(out)
    print("Projects folder has been created.")
  end
end

projects.is_valid_path = function(path)
  return vim.fn.expand(path)
end

projects.create = function()
  local proj = {}

  local name = vim.fn.input("Insira o nome do projeto:\n")

  while #name == 0 do
    name = vim.fn.input("Insira o nome do projeto:\n")
  end

  local rootpath = vim.fn.input("Insira o caminho para a raiz do projeto.")

  while #rootpath == 0 or not projects.is_valid_path(rootpath) do
    rootpath = vim.fn.input("Insira o caminho para a raiz do projeto.")
  end

  if vim.fn.isdirectory(rootpath) == 1 then
    print("Debug: Pasta existente.")
  else
    if vim.fn.mkdir(rootpath, "p") == 0 then
      print("Falha ao criar a pasta raiz do projeto")
    else
      print("Criado no caminho:\n" .. rootpath)
    end
  end

  proj.name = name
end

return projects
