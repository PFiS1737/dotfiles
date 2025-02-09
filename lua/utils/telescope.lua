local telescope_pickers = require("telescope.pickers")
local telescope_config = require("telescope.config").values
local telescope_actions = require("telescope.actions")

---@class utils.telescope
local M = {}

---@param key string
---@param action_name string
---@see From telescope commit 1bb28df
function M.gen_mouse_action(key, action_name)
  local action_state = require("telescope.actions.state")

  ---@param prompt_bufnr number: The prompt bufnr
  return function(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local mouse_win = vim.fn.getmousepos().winid

    if mouse_win == picker.results_win then
      vim.schedule(function()
        telescope_actions[action_name](prompt_bufnr)
      end)
      return ""
    else
      return key
    end
  end
end

function M.get_layout()
  local strategy = "flex"
  local config = {
    width = 0.8,
    height = 0.8,
    prompt_position = "top",

    -- FIXME: enable this config with dropdown theme would cause error
    --        -> 'Unsupported layout_config key for the center strategy: flip_lines'
    --
    -- flip_columns = 120, -- default: horizontal.preview_cutoff
    -- flip_lines = 40, -- default: vertical.preview_cutoff

    -- when: columns < flip_columns and lines >= flip_lines
    vertical = {
      preview_cutoff = 40,
      preview_height = 0.5,
    },

    -- otherwise
    horizontal = {
      preview_cutoff = 80,
      preview_width = 0.5,
    },
  }

  return strategy, config
end

return M
