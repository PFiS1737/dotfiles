---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.astro" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        astro = {
          filetypes = { "astro", "markdown", "markdown.mdx" },
          init_options = {
            contentIntellisense = true,
          },
        },
      },
    },
  },
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
