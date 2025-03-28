---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "typst" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tinymist = {
          single_file_support = true,
          settings = {
            exportPdf = "onSave", -- onType, onSave or never.
            formatterMode = "typstyle",
          },
        },
      },
    },
  },
}
