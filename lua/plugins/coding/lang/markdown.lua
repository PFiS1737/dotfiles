---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.markdown" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      nested = false,
      win_options = {
        conceallevel = {
          default = 0,
          rendered = 3,
        },
        concealcursor = {
          default = "",
          rendered = "",
        },
      },
      completions = {
        blink = {
          enabled = true,
        },
      },
      checkbox = {
        enabled = true,
      },
      sign = {
        enabled = false,
      },
      yaml = {
        enabled = false,
      },
      latex = {
        enabled = false,
      },
    },
  },
}
