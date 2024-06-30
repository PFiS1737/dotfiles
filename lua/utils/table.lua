---@class utils.table
local M = {}

---@param t table
---@param comp? fun(a, b): boolean
---@return table
function M.sort_by_key(t, comp)
  local keys = vim.tbl_keys(t)
  table.sort(keys, comp)

  local output = {}
  for _, k in ipairs(keys) do
    output[k] = t[k]
  end

  return output
end

return M
