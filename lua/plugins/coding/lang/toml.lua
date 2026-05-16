---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "toml" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Tombi is more actively maintained than Taplo
        --
        -- See 'The future of the project'
        -- https://github.com/tamasfe/taplo/issues/715
        tombi = {},
      },
    },
  },
}
