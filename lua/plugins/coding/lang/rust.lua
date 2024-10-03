---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        -- see `:h rustaceanvim.mason`
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts or {}, {
        tools = {
          executor = "toggleterm",
          test_executor = "toggleterm",
          crate_test_executor = "toggleterm",
          float_win_config = {
            max_width = 80,
            max_height = 20,
            border = {
              { "" },
              { "" },
              { "" },
              { " " }, -- left
              { "" },
              { "" },
              { "" },
              { " " }, -- right
            },
          },
        },
        server = {
          default_settings = {
            ["rust-analyzer"] = require("config.lsp.rust-analyzer"),
          },
          on_attach = function(_, buffer)
            local map = require("utils.keymap").create_map_for(buffer, "n")

            map("<leader>c<c-r>", "<cmd>RustLsp run<cr>", "Run (Rust)")
            map("<leader>dd", "<cmd>RustLsp debug<cr>", "Start debug (Rust)")
            map("<leader>c<a-r>", "<cmd>RustLsp runnables<cr>", "Runnables (Rust)")
            map("<leader>dR", "<cmd>RustLsp debuggables<cr>", "Debuggables (Rust)")
            map("<leader>tR", "<cmd>RustLsp testables<cr>", "Testables (Rust)")
            map("gp", "<cmd>RustLsp parentModule<cr>", "Go to parent module (Rust)")
          end,
        },
      })

      if vim.env.TERMUX_VERSION ~= nil then
        opts.dap = {
          -- FIXME: Termux don't have a codelldb package now
          adapter = {
            type = "executable",
            command = "lldb-dap",
            name = "lldb",
          },
        }
      end

      return opts
    end,
  },
}
