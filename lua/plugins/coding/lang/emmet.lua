---@module "lazy"
---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "emmet-language-server" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {
          init_options = {
            -- showSuggestionsAsSnippets = true,
          },
        },
      },
    },
  },
}
