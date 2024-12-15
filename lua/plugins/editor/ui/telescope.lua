---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.editor.telescope" },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Plugin files",
      },
    },
    opts = function(_, opts)
      -- set the prompt highlights back to default
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "TelescopeBorder" })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "TelescopeTitle" })

      -- get the default value of `get_status_text()`
      local get_status_text = require("telescope.config").values.get_status_text

      local keys = {
        ["<C-X>"] = false,
        ["<C-H>"] = require("telescope.actions").select_horizontal,
      }

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        prompt_prefix = "  ", -- use space as left padding
        selection_caret = " ",
        entry_prefix = " ",
        multi_icon = " ",
        -- wrap_results = true,
        scroll_strategy = "cycle", -- or "limit"
        layout_strategy = "flex",
        layout_config = require("utils.telescope").get_layout_config(),
        get_status_text = function(self, _opts)
          return get_status_text(self, _opts) .. " " -- add right padding
        end,
        mappings = {
          i = keys,
          n = keys,
        },
      })
    end,
  },
}
