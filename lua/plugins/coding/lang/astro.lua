---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.astro" },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettier" },
      },
      formatters = {
        prettier = {
          condition = function(_, ctx)
            return vim.endswith(ctx.filename, ".astro")
          end,
        },
      },
    },
  },
}
