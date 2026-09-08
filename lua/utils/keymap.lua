---@class utils.keymap
local M = {}

---@param buffer any
---@return fun(mode: string|string[], lhs: string|string[], rhs: string|function, desc: string)
function M.create_map_for(buffer)
  return function(mode, lhs, rhs, desc)
    lhs = type(lhs) == "string" and { lhs } or lhs ---@type string[]
    for _, alhs in ipairs(lhs) do
      vim.keymap.set(mode, alhs, rhs, { desc = desc, buffer = buffer })
    end
  end
end

---@param buffer any
---@param mode string|string[]
---@return fun(lhs: string|string[], rhs: string|function, desc: string)
function M.create_map_for_mode(buffer, mode)
  return function(lhs, rhs, desc)
    lhs = type(lhs) == "string" and { lhs } or lhs ---@type string[]
    for _, alhs in ipairs(lhs) do
      vim.keymap.set(mode, alhs, rhs, { desc = desc, buffer = buffer })
    end
  end
end

return M
