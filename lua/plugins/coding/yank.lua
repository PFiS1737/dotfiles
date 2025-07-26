---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.coding.yanky" },
  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    -- overrite default keymaps
    keys = function()
      return {
        {
          "<leader>sy",
          function()
            Snacks.picker.yanky()
          end,
          mode = { "n", "x" },
          desc = "Yank History",
        },
        { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
        {
          "p",
          "<Plug>(YankyPutAfter)",
          mode = { "n", "x" },
          desc = "Put Yanked Text After Cursor",
        },
        {
          "P",
          "<Plug>(YankyPutBefore)",
          mode = { "n", "x" },
          desc = "Put Yanked Text Before Cursor",
        },
      }
    end,
  },
}
