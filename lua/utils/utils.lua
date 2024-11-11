local utils = {}

utils.table = {}

utils.path = {}

utils.table.is_empty = function(t)
  for _ in pairs(t) do
    return false
  end
end

utils.table.print = function(t)
  for _, v in pairs(t) do
    print(v)
  end
end

utils.table.lenght = function(t)
  local c = 0
  for _, _ in pairs(t) do
    c = c + 1
  end
  return c
end
return utils
