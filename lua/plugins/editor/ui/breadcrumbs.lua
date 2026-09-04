---@module "lazy"
---@type LazySpec
return {
  {
    "Bekaboo/dropbar.nvim",
    event = "LazyFile",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "gB",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Pick Breadcrumbs",
      },
    },
    opts = function()
      local enable = require("dropbar.configs").opts.bar.enable

      ---@module "dropbar"
      ---@type dropbar_configs_t
      return {
        bar = {
          enable = function(buf, win, info)
            return vim.bo[buf].bt ~= "terminal"
              and vim.bo[buf].ft ~= "neo-tree"
              and enable(buf, win, info)
          end,
        },
        sources = {
          path = {
            relative_to = function(buf, _)
              return LazyVim.root.get({ buf = buf })
            end,
          },
        },
        icons = {
          ui = {
            bar = {
              separator = "  ",
            },
          },
        },
        menu = {
          preview = false,
          quick_navigation = false,
          scrollbar = {
            enable = false,
          },
        },
      }
    end,
  },
}
