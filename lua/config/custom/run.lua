local scan = require("plenary.scandir").scan_dir

local function trim(str)
  local idx_last_sep = nil

  for idx = 1, #str do
    local l = str:sub(idx, idx)
    if l == "/" then
      idx_last_sep = idx
    end
  end

  local file = str:sub(idx_last_sep, #str)
end

local function run()
  local buildpath = vim.fn.getcwd() .. "/build/output"
  print("BuildPath: " .. buildpath)

  local res = scan(buildpath, {
    hidden = false,
    add_dirs = false,
  })

  for _, f in pairs(res) do
    vim.cmd("terminal " .. f)
  end
end

return {
  name = "Run",
  callback = run,
  opt = {
    desc = "Execute actual project.",
  },
}
