---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.tex" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "tectonic" },
    },
  },
}
