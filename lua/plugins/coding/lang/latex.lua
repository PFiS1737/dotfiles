---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.tex" },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "tectonic" },
    },
  },
}
