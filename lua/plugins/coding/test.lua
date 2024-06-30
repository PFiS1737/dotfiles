---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.test.core" },

  {
    "nvim-neotest/neotest",
    init = function()
      -- FIXME: vim.loop.cpu_info() return nil in termux
      if vim.env.TERMUX_VERSION ~= nil then
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.loop.cpu_info = function()
          return {
            [1] = nil,
          }
        end
      end
    end,
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
