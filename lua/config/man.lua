require("lazy").setup({
  spec = {
    {
      "folke/tokyonight.nvim",
      priority = 1000,
      lazy = false,
      config = function()
        require("tokyonight").setup({ style = "moon" })
        require("tokyonight").load()
      end,
    },
  },
  install = { colorscheme = { "tokyonight" } },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
