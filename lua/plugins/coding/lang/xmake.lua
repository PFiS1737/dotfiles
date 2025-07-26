---@module "lazy"
---@type LazySpec
return {
  {
    "Mythos-404/xmake.nvim",
    event = "LazyFile",
    init = function()
      -- disable `xmake.nvim/plugin/xmake.lua`
      -- we will register our own autocommands later
      vim.g.loaded_xmake = false
    end,
    opts = {
      runner = { type = "terminal" },
    },
    config = function(_, opts)
      require("xmake").setup(opts)

      local cwd = LazyVim.root()
      local should = nil
      local function should_load()
        local current_cwd = LazyVim.root()
        if current_cwd ~= cwd then
          cwd = current_cwd
        elseif should ~= nil then
          return should
        end

        local code =
          vim.system({ "xmake", "show", "--list=targets" }, { cwd = cwd }):wait().code
        if code == 0 then
          should = true
        else
          should = false
        end

        return should
      end

      local group = vim.api.nvim_create_augroup("xmake", { clear = true })

      vim.api.nvim_create_autocmd({ "LspAttach" }, {
        group = group,
        pattern = "xmake.lua",
        callback = function(args)
          require("xmake").lsp.init(args)
        end,
      })

      local loaded = false
      vim.api.nvim_create_autocmd({ "BufReadPost" }, {
        group = group,
        callback = function()
          if should_load() and not loaded then
            loaded = true
            require("xmake").info.all_defer_reload()
            vim.notify("Loaded xmake.lua", vim.log.levels.INFO, { title = "xmake.nvim" })
          end
        end,
      })

      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        group = group,
        pattern = "xmake.lua",
        callback = function()
          if should_load() then
            local xmake = require("xmake")
            xmake.info.defer_reload("mode")
            xmake.info.defer_reload("target")
            xmake.action.project("kind", "compile_commands")
          end
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          on_attach = function(_, buffer)
            if #vim.fs.find("xmake.lua", { path = LazyVim.root() }) == 1 then
              local map = require("utils.keymap").create_map_for(buffer, "n")

              map("<leader>dd", "<cmd>Xmake debug<cr>", "Debug (Xmake)")
            end
          end,
        },
      },
    },
  },
}
