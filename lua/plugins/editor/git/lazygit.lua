local path = require("utils.path")

---@module "lazy"
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
    },
  },
}
