---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.coding.neogen" },
  {
    "folke/todo-comments.nvim",
    opts = {
      -- merge_keywords = false, -- enable custom keywords
      keywords = {
        NOTE = { icon = " ", color = "hint", alt = {} },
        INFO = { icon = " ", color = "info" },
      },
    },
  },
}
