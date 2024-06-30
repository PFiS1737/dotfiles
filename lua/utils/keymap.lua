---@class utils.keymap
local M = {}

---@param buffer any
---@param mode? string|table
function M.create_map_for(buffer, mode)
  if mode ~= nil then
    ---@param lhs string
    ---@param rhs string|function
    ---@param desc? string
    return function(lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = buffer })
    end
  else
    ---@param mode string|table
    ---@param lhs string
    ---@param rhs string|function
    ---@param desc? string
    ---@diagnostic disable-next-line: redefined-local
    return function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { desc = desc, buffer = buffer })
    end
  end
end

return M
