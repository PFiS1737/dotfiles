---@class utils
---@field keymap utils.keymap
---@field path utils.path
---@field table utils.table
local M = setmetatable({}, {
  __index = function(_, k)
    return require("utils." .. k)
  end,
})

return M
