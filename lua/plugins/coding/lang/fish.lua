---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "fish" } },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "ndonfris/fish-lsp",
        build = "yarn install",
      },
    },
    opts = {
      servers = {
        fish_lsp = {},
      },
    },
  },
}
