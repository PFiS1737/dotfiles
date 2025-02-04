---@class utils.neotree
local M = {}

---@see https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#find-with-telescope
function M.telescope(action_name)
  return function(state)
    local opts = {
      cwd = state.path,
      search_dirs = { state.path },
      attach_mappings = function(prompt_bufnr)
        local actions = require("telescope.actions")
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local action_state = require("telescope.actions.state")
          local selection = action_state.get_selected_entry()
          local filename = selection.filename or selection[1]

          ---@diagnostic disable-next-line: missing-parameter
          require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
        end)
        return true
      end,
    }

    require("telescope.builtin")[action_name](opts)
  end
end

return M
