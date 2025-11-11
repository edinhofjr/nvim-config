---@alias KeymapModes "n" | "i" | "v" | KeymapModes[]

---@alias KeymapTrigger string | function 

---@alias KeymapAction string | function

---@alias KeymapOptional vim.keymap.set.Opts

---@class KeymapBinding
---@field modes KeymapModes
---@field trigger string
---@field action function | string
---@field opts KeymapOptional

