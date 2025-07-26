---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "html" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        superhtml = {},
      },
    },
  },
}
