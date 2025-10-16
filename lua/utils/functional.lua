ForEach = function (array, callback_function)
    vim.notify(vim.inspect(array))
    for k,v in pairs(array) do
        callback_function(k,v)
    end
end
