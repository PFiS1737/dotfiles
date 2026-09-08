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

            map("<leader>c<c-f>", function()
              local picker = Snacks.picker.pick({
                title = "Cargo Features",
                layout = { preset = "select" },
                finder = function()
                  local cwd = LazyVim.root()

                  local cmd = {
                    "cargo",
                    "metadata",
                    "--no-deps",
                    "--format-version",
                    "1",
                  }

                  ---@type snacks.picker.finder.Item[]
                  local features = {}

                  ---@type fun(sc: vim.SystemCompleted)
                  local function on_exit(sc)
                    if sc.code ~= 0 then
                      vim.schedule(function()
                        vim.notify("cargo metadata failed", vim.log.levels.ERROR)
                      end)
                      return
                    end

                    local ok, data = pcall(vim.json.decode, sc.stdout)
                    if not ok or not data then
                      vim.schedule(function()
                        vim.notify("failed to parse cargo metadata", vim.log.levels.ERROR)
                      end)
                      return
                    end

                    for _, pkg in ipairs(data.packages or {}) do
                      for feature_name, _ in pairs(pkg.features or {}) do
                        features[#features + 1] = {
                          text = feature_name,
                          pkg = pkg.name,
                          id = pkg.id,
                        }
                      end
                    end
                  end

                  vim.system(cmd, { cwd = cwd, text = true }, on_exit):wait()

                  return features
                end,
                format = function(item)
                  local a = Snacks.picker.util.align
                  return {
                    { a(item.text, 30), field = "text" },
                    { item.pkg, "SnacksPickerDir", virtual = true },
                  }
                end,
                confirm = function(picker)
                  local selected = vim.tbl_map(function(item)
                    return item.text
                  end, picker:selected())

                  local config = { cargo = { features = selected } }

                  vim.api.nvim_buf_call(buffer, function()
                    vim.cmd.RustAnalyzer({ "config", vim.inspect(config) })
                  end)

                  vim.notify(
                    string.format(
                      "Selected Cargo features: %s",
                      table.concat(selected, ", ")
                    ),
                    vim.log.levels.INFO
                  )

                  picker:close()
                end,
              })

              local rust_analyzer = require("rustaceanvim.rust_analyzer")
              local clients = rust_analyzer.get_active_rustaceanvim_clients(buffer)
              assert(#clients == 1)
              local client = clients[1]

              local selected_features = vim.tbl_get(
                client.settings,
                "rust-analyzer",
                "cargo",
                "features"
              ) or {}

              for item in picker:iter() do
                if vim.tbl_contains(selected_features, item.text) then
                  picker.list:select(item)
                end
              end

              picker:show()
            end, "Select Cargo Features (Rust)")
          end,
        },
      })

      -- Override any other settings
      opts.server.default_settings["rust-analyzer"] = require("config.lsp.rust-analyzer")

      return opts
    end,
  },
}
