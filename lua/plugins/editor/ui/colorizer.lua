---@type LazySpec
return {
  {
    "uga-rosa/ccc.nvim",
    cmd = {
      -- "CccPick",
      -- "CccConvert",
      "CccHighlighterToggle",
    },
    keys = {
      {
        "<leader>zc",
        "<cmd>CccHighlighterToggle<cr>",
        desc = "Toggle colorizer",
      },
      -- { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick Color" },
      -- { "<leader>z<c-c>", "<cmd>CccConvert<cr>", desc = "Convert color" },
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
