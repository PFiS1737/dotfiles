---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.markdown" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "markdown.mdx", "norg", "rmd", "org", "codecompanion" },
    opts = {
      file_types = { "markdown", "markdown.mdx" },
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
