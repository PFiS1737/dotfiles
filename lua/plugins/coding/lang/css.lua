---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "css", "scss" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        css_variables = {},
        cssmodules_ls = {},
        somesass_ls = {
          ---@see https://wkillerud.github.io/some-sass/user-guide/settings.html
          -- NOTE: don't support formatting, use biome instead
        },
      },
    },
  },
}
