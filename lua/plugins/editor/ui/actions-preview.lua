---@type LazySpec
return {
  {
    "aznhe21/actions-preview.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    event = "LspAttach",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get() or {}

      for i, cfg in ipairs(keys) do
        if cfg[1] == "<leader>ca" then
          keys[i][2] = function()
            require("actions-preview").code_actions()
          end
        end
      end

      require("lazyvim.plugins.lsp.keymaps")._keys = keys
    end,
    opts = {
      -- see https://github.com/aznhe21/actions-preview.nvim?tab=readme-ov-file#how-to-make-it-look-like-readme-above
      telescope = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = "top",
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    },
  },
}
