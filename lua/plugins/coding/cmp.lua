return {
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    ---@diagnostic disable
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
            components = {
              kind_icon = {
                text = function(ctx)
                  print(ctx.kind_icon)
                  return ctx.kind_icon .. ctx.icon_gap
                end,
              },
            },
          },
        },
        documentation = {
          window = {
            scrollbar = false,
          },
        },
      },
      appearance = {
        kind_icons = {
          Color = LazyVim.config.icons.kinds.Color,
        },
      },
    },
    ---@diagnostic enable
  },
}
