---@class utils
---@field keymap utils.keymap
---@field terminal utils.terminal
---@field path utils.path
---@field neotree utils.neotree
---@field table utils.table
---@field telescope utils.telescope
---@field defer utils.defer
local M = setmetatable({}, {
  __index = function(_, k)
    return require("utils." .. k)
  end,
})

return M
