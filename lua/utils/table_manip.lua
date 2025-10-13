local M = {}

--lhs recebe os valores, rhs sobrescreve em lhs
M.table_merge = function(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" and type(t1[k]) == "table" then
            M.table_merge(t1[k], v)
        else
            t1[k] = v
        end
    end
    return t1
end

M.values = function(t)
    local nt = {}
    for _, v in pairs(t) do
        table.insert(nt, v)
    end
    return nt
end

return M
