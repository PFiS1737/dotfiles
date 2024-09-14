return {
  {
    "dstein64/nvim-scrollview",
    event = "LazyFile",
    opts = {
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
