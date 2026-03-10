---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "css", "scss", "styled" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {},
        css_variables = {},
        cssmodules_ls = {},
        somesass_ls = {
          ---@see https://wkillerud.github.io/some-sass/user-guide/settings.html
          -- NOTE: don't support formatting, use biome instead
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      vim.treesitter.language.register("scss", "less")
    end,
  },
}
