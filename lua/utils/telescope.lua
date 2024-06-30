---@class utils.telescope
local M = {}

---@param key string
---@param action_name string
---@see From telescope commit 1bb28df
function M.gen_mouse_action(key, action_name)
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  ---@param prompt_bufnr number: The prompt bufnr
  return function(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local mouse_win = vim.fn.getmousepos().winid

    if mouse_win == picker.results_win then
      vim.schedule(function()
        actions[action_name](prompt_bufnr)
      end)
      return ""
    else
      return key
    end
  end
end

function M.get_layout_config()
  local output = {
    horizontal = { preview_width = { 0.55, max = 100, min = 30 } },
    vertical = { preview_cutoff = 20, preview_height = 0.5 },
  }

  if vim.env.TERMUX_VERSION ~= nil then
    -- the max columns in termux is 141
    output.flex = { flip_columns = 140 }
  end

  return output
end

return M
