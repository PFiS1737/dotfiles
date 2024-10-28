---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.editor.inc-rename" },
  {
    "smjonas/inc-rename.nvim",
    opts = {
      save_in_cmdline_history = false,
    },
  },
}
