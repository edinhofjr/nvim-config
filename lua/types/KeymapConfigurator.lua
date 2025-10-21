---@alias KeymapModes "n" | "i" | "v" | KeymapModes[]

---@class KeymapOptional 
---@field desc? string
---@field noremap? boolean

---@class KeymapBinding
---@field modes KeymapModes
---@field trigger string
---@field action function | string
---@field opts KeymapOptional
