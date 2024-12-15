---@type LazySpec
return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    build = ":UpdateRemotePlugins",
    event = "LazyFile",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            tailwindcss = {},
          },
          setup = {
            -- tailwind-tools.nvim will setup the server.
            tailwindcss = function()
              return true
            end,
          },
        },
      },
      {
        "hrsh7th/nvim-cmp",
        optional = true,
        opts = function(_, opts)
          local format = opts.formatting.format

          opts.formatting.format = function(entry, item)
            return format(
              entry,
              require("tailwind-tools.cmp").lspkind_format(entry, item)
            )
          end
        end,
      },
    },
    opts = {
      conceal = {
        -- enabled = true,
        min_length = 40,
        symbol = "󱏿",
      },
      server = {
        settings = {},
      },
    },
  },
}
