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
          -- fix chinese character issue
          -- @see https://github.com/neovim/neovim/issues/30675
          offset_encoding = "utf-8",
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
