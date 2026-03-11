---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.vue" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vue_ls = {},
      },
    },
  },
}
