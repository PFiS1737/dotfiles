---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.test.core" },

  {
    "nvim-neotest/neotest",
    keys = {
      {
        "<leader>tT",
        function()
          -- use root dir instead of cwd
          require("neotest").run.run(LazyVim.root.get())
        end,
        desc = "Run All Test Files",
      },
    },
  },
}
