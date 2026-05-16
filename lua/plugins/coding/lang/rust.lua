---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.rust" },
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", {}, opts or {}, {
        tools = {
          executor = "termopen",
          test_executor = "neotest",
          crate_test_executor = "neotest",
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
          on_attach = function(_, buffer)
            local map = require("utils.keymap").create_map_for(buffer, "n")

            -- `textDocument/hover` got deprecated
            -- see https://github.com/mrcjkb/rustaceanvim/issues/556#issuecomment-2447859092
            map("K", "<cmd>RustLsp hover actions<cr>", "Hover actions (Rust)")

            map("<leader>ce", "<cmd>RustLsp expandMacro<cr>", "Expand Macro (Rust)")
            map("<leader>co", "<cmd>RustLsp openDocs<cr>", "Open Docs (Rust)")
            map("<leader>cO", "<cmd>RustLsp openCargo<cr>", "Open Cargo.toml (Rust)")
            map("<leader>c<c-r>", "<cmd>RustLsp run<cr>", "Run (Rust)")
            map("<leader>dd", "<cmd>RustLsp debug<cr>", "Debug (Rust)")
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

      opts.server.default_settings["rust-analyzer"] = require("config.lsp.rust-analyzer")

      return opts
    end,
  },
}
