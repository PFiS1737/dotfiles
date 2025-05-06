---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "dart" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = { enabled = false },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "dart-debug-adapter" } },
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      ui = {
        border = "shadow",
        notification_style = "native",
      },
      widget_guides = { enabled = true },
      closing_tags = { enabled = false },
      dev_log = { enabled = false },
      -- debugger = { enabled = true },
      lsp = {
        --- use `ccc.nvim` instaed
        color = { enabled = false },
        settings = {
          showTodos = false,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      },
    },
    config = function(_, opts)
      opts.lsp = opts.lsp or {}
      opts.lsp.on_attach = function(_, buffer)
        local map = require("utils.keymap").create_map_for(buffer, "n")

        map("<leader>dd", "<cmd>FlutterDebug<cr>", "Start debugging (Flutter)")
        map("<leader>c<c-r>", function()
          local terminal, created = Snacks.terminal.get({ "flutter", "run" }, {
            interactive = false,
            win = {
              position = "right",
            },
          })

          if not terminal then
            return
          end

          if not created then
            terminal:toggle()
            return
          end

          local bufnr = terminal.buf
          if not bufnr then
            return
          end

          local group_name = "flutter_run_hot_update_on_save"
          vim.api.nvim_create_augroup(group_name, { clear = true })

          terminal:on("TermClose", function()
            vim.api.nvim_del_augroup_by_name(group_name)
          end, { buf = true })

          local chan_id = vim.api.nvim_buf_get_var(bufnr, "terminal_job_id")

          vim.keymap.set("n", "Q", function()
            vim.api.nvim_chan_send(chan_id, "q")
            terminal:close()
          end, { desc = "Quit", buffer = bufnr })

          vim.api.nvim_create_autocmd("BufWritePost", {
            group = group_name,
            pattern = "*",
            callback = function()
              vim.api.nvim_chan_send(chan_id, "r")
            end,
          })
        end, "Run (Flutter)")
      end

      require("flutter-tools").setup(opts)
    end,
  },
}
