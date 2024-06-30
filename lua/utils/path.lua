---@class utils.path
local M = {}

---@param path string
---@param root string
---@return string
function M.relative(path, root)
  local path_len = string.len(path)
  local root_len = string.len(root)

  if string.sub(path, 1, root_len) == root then
    return string.sub(path, root_len + 2, path_len)
  else
    return path
  end
end

return M
