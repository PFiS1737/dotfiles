---@class utils.keymap
local M = {}

---@param buffer any
---@param mode? string|string[]
function M.create_map_for(buffer, mode)
  if mode ~= nil then
    return function(lhs, rhs, desc)
      lhs = type(lhs) == "string" and { lhs } or lhs
      for _, alhs in ipairs(lhs) do
        vim.keymap.set(mode, alhs, rhs, { desc = desc, buffer = buffer })
      end
    end
  else
    ---@diagnostic disable-next-line: redefined-local
    return function(mode, lhs, rhs, desc)
      lhs = type(lhs) == "string" and { lhs } or lhs
      for _, alhs in ipairs(lhs) do
        vim.keymap.set(mode, alhs, rhs, { desc = desc, buffer = buffer })
      end
    end
  end
end

return M
