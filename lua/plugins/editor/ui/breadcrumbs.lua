---@type LazySpec
return {
  {
    "Bekaboo/dropbar.nvim",
    event = "LazyFile",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-tree/nvim-web-devicons",

      -- use which-key to define keymaps
      ---@see https://github.com/LazyVim/LazyVim/issues/4502
      {
        "folke/which-key.nvim",
        opts = {
          spec = {
            {
              "<leader>ub",
              function()
                ---@see https://github.com/Bekaboo/dropbar.nvim/issues/115
                if vim.o.winbar == "" then
                  vim.o.winbar = "%{%v:lua.dropbar.get_dropbar_str()%}"
                else
                  vim.o.winbar = ""
                end
              end,
              desc = "Toggle Breadcrumbs",
            },
          },
        },
      },
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
    opts = {
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
    },
    config = function(_, opts)
      require("dropbar").setup(opts)

      vim.api.nvim_set_hl(0, "DropBarIconUISeparator", { link = "SpecialKey" })
    end,
  },
}
