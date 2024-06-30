---@type LazySpec
return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<leader>zz",
        function()
          require("treesj").toggle({ split = { recursive = true } })
        end,
        desc = "Split or join (recursively)",
      },
      { "<leader>zZ", "<cmd>TSJToggle<cr>", desc = "Split or join" },
    },
    opts = {
      use_default_keymaps = false,
      max_join_length = 1024,
      cursor_behavior = "start",
    },
  },
}
