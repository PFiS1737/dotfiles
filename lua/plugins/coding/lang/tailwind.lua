---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          lsp = {
            opts = {
              tailwind_color_icon = "■ ",
            },
          },
        },
      },
    },
  },
}
