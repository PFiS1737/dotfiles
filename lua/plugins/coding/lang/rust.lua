---@type fun(client:vim.lsp.Client, buffer: number): fun()
local create_cargo_features_picker

---@module "lazy"
---@type LazySpec
local M = {
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
          on_attach = function(client, buffer)
            local map = require("utils.keymap").create_map_for_mode(buffer, "n")

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

            map(
              "<leader>c<c-f>",
              create_cargo_features_picker(client, buffer),
              "Select Cargo Features (Rust)"
            )
          end,
        },
      })

      -- Override any other settings
      opts.server.default_settings["rust-analyzer"] = require("config.lsp.rust-analyzer")

      return opts
    end,
  },
}

function create_cargo_features_picker(client, buffer)
  return function()
    local buf_path = vim.api.nvim_buf_get_name(buffer)

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
        local pkg_dir = vim.fs.dirname(pkg.manifest_path) .. "/"
        if buf_path:sub(1, #pkg_dir) == pkg_dir then
          for feature_name, _ in pairs(pkg.features or {}) do
            features[#features + 1] = {
              text = feature_name,
            }
          end
          break
        end
      end
    end

    vim
      .system({
        "cargo",
        "metadata",
        "--no-deps",
        "--format-version",
        "1",
      }, {
        cwd = client.root_dir or LazyVim.root(),
        text = true,
      }, on_exit)
      :wait()

    local picker = Snacks.picker.pick({
      title = "Cargo Features",
      layout = { preset = "select" },
      items = features,
      format = "text",
      formatters = {
        selected = {
          show_always = true,
          unselected = false,
        },
      },
      confirm = function(picker)
        -- toggle selection of current item
        picker.list:select()

        local selected = vim.tbl_map(function(item)
          return item.text
        end, picker:selected())

        require("rustaceanvim.lsp").set_config(
          buffer,
          { cargo = { features = selected } }
        )

        vim.notify(
          string.format(
            "Selected Cargo features: %s",
            #selected == 0 and "<none>" or table.concat(selected, ", ")
          ),
          vim.log.levels.INFO
        )

        picker:close()
      end,
    })

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
  end
end

return M
