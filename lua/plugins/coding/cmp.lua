---@module "lazy"
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
      cmdline = {
        enabled = true,
        completion = {
          list = {
            selection = {
              preselect = false,
            },
          },
          ghost_text = {
            enabled = false,
          },
          menu = {
            auto_show = function(_)
              return vim.fn.getcmdtype() == ":"
            end,
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
