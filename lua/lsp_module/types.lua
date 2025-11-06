local T = {}

---@alias Languages
---| "c"
---| "cpp"
---| "javascript"
---| "lua"
---| "go"

---@alias LanguageServer
---| "gopls"
---| "lua_ls"
---| "clangd"

---@alias LanguageMason
---| "lua-language-server"

---@type table<Languages, LanguageServer>
T.language_lsp = {
    ["go"] = "gopls",
    ["lua"] = "lua_ls",
    ["c"] = "clangd"
}

---@type table<Languages, LanguageMason>
T.language_mason = {
    ["lua"] = "lua-language-server",
}

T.language_mason = vim.tbl_extend('force', T.language_lsp, T.language_mason)

---@param language Languages
---@return LanguageServer 
T.getLSP = function(language)
    return T.language_lsp[language]
end

---@param language Languages
---@return LanguageMason
T.getMasonName = function(language)
    return T.language_mason[language]
end

return T

