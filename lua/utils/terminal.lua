---@class utils.terminal
local M = {}

---@param type string
---@param trim_spaces boolean
function M.send_lines(type, trim_spaces)
  require("toggleterm").send_lines_to_terminal(type, trim_spaces, { args = vim.v.count })
end

---@param dir? string
function M.toggle_float(dir)
  require("toggleterm").toggle(vim.v.count, 0, dir, "float")
end

---@param cmd table
---@param dir? string
---@param direction? string
function M.toggle_cmd(cmd, dir, direction)
  require("toggleterm.terminal").Terminal
    :new({
      cmd = vim.fn.join(cmd, " "),
      dir = dir,
      direction = direction or "float",
      hidden = true,
    })
    :toggle()
end

---@param dir? string
---@param size? integer
function M.toggle_horizontal(dir, size)
  require("toggleterm").toggle(vim.v.count, size or 15, dir, "horizontal")
end

return M
