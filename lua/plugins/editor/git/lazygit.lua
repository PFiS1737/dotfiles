local path = require("utils.path")

---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>gf",
        function()
          Snacks.lazygit({
            args = {
              "-f",
              path.relative(vim.api.nvim_buf_get_name(0), LazyVim.root.git()),
            },
          })
        end,
        desc = "Lazygit Current File History",
      },
      {
        "<leader>gl",
        function()
          Snacks.lazygit({
            args = { "log" },
          })
        end,
        desc = "Lazygit Log",
      },
      {
        "<leader>gL",
        function() end, -- disable cwd log provide by LazyVim
        desc = "which_key_ignore",
      },
    },
  },
}
