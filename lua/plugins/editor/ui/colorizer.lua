---@module "lazy"
---@type LazySpec
return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    keys = {
      { "<leader>zc", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" },
    },
    opts = {
      filetypes = { "*", "!blink-cmp-menu" },
      options = {
        parsers = {
          hex = {
            rgb = false,
            rgba = false,
            hash_aarrggbb = false,
            aarrggbb = false,
          },
          names = { enable = false },
          css = true,
          css_fn = true,
          sass = { enable = true },
          tailwind = {
            enable = true,
            update_names = true,
            lsp = {
              enable = true,
              disable_document_color = true,
            },
          },
        },
        -- display = {
        --   mode = "virtualtext",
        --   virtualtext = {
        --     char = "■",
        --     position = "before",
        --   },
        -- },
      },
    },
  },
  {
    "uga-rosa/ccc.nvim",
    keys = {
      { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick Color" },
      { "<leader>zC", "<cmd>CccConvert<cr>", desc = "Convert color" },
    },
    opts = function()
      local ccc = require("ccc")
      return {
        highlighter = {
          auto_enable = false,
        },
        mappings = {
          ["<esc>"] = ccc.mapping.quit,
        },
      }
    end,
  },
}
