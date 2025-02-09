---@type LazySpec
return {
  {
    "saghen/blink.cmp",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
        menu = {
          scrollbar = false,
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },
        documentation = {
          window = {
            scrollbar = false,
          },
        },
      },
      -- signature = {
      --   enabled = true,
      --   window = {
      --     scrollbar = false,
      --     show_documentation = true,
      --   },
      -- },
    },
  },
}
