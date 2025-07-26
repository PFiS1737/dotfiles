---@module "lazy"
---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        style = "fancy",
      },
      styles = {
        notification = {
          wo = {
            -- remove `"extends:…`
            listchars = "tab:  ",
          },
        },
      },
    },
  },
}
