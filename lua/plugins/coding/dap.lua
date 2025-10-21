---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.dap.nlua" },
  {
    "jbyuki/one-small-step-for-vimkind",
    keys = {
      {
        "<leader>dL",
        function()
          require("osv").launch({ port = 8086 })
        end,
        desc = "Start OSV Server",
      },
    },
  },
}
