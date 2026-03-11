---@module "lazy"
---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        vue = { "prettier" },
        astro = { "prettier" },
      },
      -- formatters = {
      --   prettier = {
      --     condition = function(_, ctx)
      --       return vim.endswith(ctx.filename, ".astro")
      --         or vim.endswith(ctx.filename, ".vue")
      --     end,
      --   },
      -- },
    },
  },
}
