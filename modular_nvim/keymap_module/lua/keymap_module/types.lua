---@alias KeymapModes "n" | "i" | "v" | KeymapModes[]

---@alias KeymapTrigger string | function 

---@alias KeymapAction string | function

---@class KeymapOptional 
---@field desc? string
---@field noremap? boolean

---@class KeymapBinding
---@field modes KeymapModes
---@field trigger string
---@field action function | string
---@field opts KeymapOptional
