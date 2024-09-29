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
        -- FIXME: need to install superhtml by yourself. (yay -S superhtml)
        superhtml = {},
      },
    },
  },
}
