---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.typst" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          settings = {
            -- exportPdf = "onSave", -- onType, onSave or never.
          },
        },
      },
    },
  },
}
