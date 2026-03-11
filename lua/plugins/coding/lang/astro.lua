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
}
