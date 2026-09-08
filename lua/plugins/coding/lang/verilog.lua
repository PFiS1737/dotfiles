---@module "lazy"
---@type LazySpec
return {
  -- verilog
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "systemverilog" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        verible = {
          cmd = { "verible-verilog-ls", "--lsp_enable_hover" },
        },
      },
    },
  },

  -- verly
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          ---@diagnostic disable: missing-fields
          require("nvim-treesitter.parsers").veryl = {
            install_info = {
              url = "https://github.com/veryl-lang/tree-sitter-veryl",
              files = { "src/parser.c" },
              branch = "main",
            },
            filetype = "veryl",
          }
          ---@diagnostic enable: missing-fields
        end,
      })

      vim.filetype.add({
        extension = {
          veryl = "veryl",
        },
      })

      opts.ensure_installed = opts.ensure_installed or {}
      opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "veryl" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        veryl_ls = {
          mason = false,
        },
      },
    },
  },
  {
    "folke/ts-comments.nvim",
    opts = {
      lang = {
        veryl = { "// %s", "/* %s */" },
      },
    },
  },
}
