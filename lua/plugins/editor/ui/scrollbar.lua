return {
  {
    "folke/snacks.nvim",
    opts = function()
      vim.g.snacks_scroll = false
    end,
  },
  {
    "dstein64/nvim-scrollview",
    event = "LazyFile",
    keys = {
      {
        "<leader>uo",
        "<cmd>ScrollViewToggle<cr>",
        desc = "Toggle Scrollbar",
      },
    },
    opts = {
      on_startup = false,
      signs_on_startup = {}, -- only need the draggable scrollbar
      excluded_filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
      },
    },
  },
}
