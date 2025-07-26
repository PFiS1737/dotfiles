---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.ui.indent-blankline" },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      exclude = {
        filetypes = {
          "snacks_picker_preview",
        },
      },
    },
  },
}
