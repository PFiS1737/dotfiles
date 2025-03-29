---@type LazySpec
return {
  {
    "uga-rosa/ccc.nvim",
    cmd = {
      "CccPick",
      "CccConvert",
      "CccHighlighterToggle",
    },
    keys = {
      { "<leader>zp", "<cmd>CccPick<cr>", desc = "Pick Color" },
      { "<leader>zC", "<cmd>CccConvert<cr>", desc = "Convert color" },
      { "<leader>zc", "<cmd>CccHighlighterToggle<cr>", desc = "Toggle colorizer" },
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
