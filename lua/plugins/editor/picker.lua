---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.editor.snacks_picker" },
  {
    "folke/snacks.nvim",
    dependencies = { "polirritmico/telescope-lazy-plugins.nvim" },
    keys = {
      {
        "<leader>fP",
        function()
          Snacks.picker.files({
            title = "Plugin Files",
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Plugin files",
      },
      {
        "<leader>fC",
        function()
          Snacks.picker.lazy({
            title = "Lazy Spec",
          })
        end,
        desc = "Find Plugin Spec",
      },
      {
        "<leader>sp",
        function()
          Snacks.picker.spelling()
        end,
        desc = "Show spelling suggestions",
      },
    },
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "SnacksPickerPrompt", { link = "Conditional" })
      vim.api.nvim_set_hl(0, "SnacksPickerInputBorder", { link = "SnacksPickerBorder" })
      vim.api.nvim_set_hl(0, "SnacksPickerInputTitle", { link = "SnacksPickerTitle" })

      -- don't use loaded buffer in any case
      local preview_file = Snacks.picker.preview.file
      Snacks.picker.preview.file = function(ctx)
        ctx.item.buf = false
        preview_file(ctx)
      end

      local ret = vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          prompt = "  ",
          layout = {
            preset = function()
              return vim.o.columns >= 120 and "default"
                or vim.o.lines >= 40 and "vertical"
                or "select"
            end,
          },
          matcher = {
            frecency = true,
          },
          selected = {
            unselected = false,
          },
          file = {
            truncate = 80,
          },
          win = {
            preview = {
              wo = {
                number = false,
                signcolumn = "no",
              },
            },
          },
          icons = {
            ui = {
              selected = " ● ",
              unselected = " ○ ",
            },
          },
          sources = {
            -- use 'default' layout instead of 'ivy'
            lines = {
              layout = {
                preview = false,
                preset = "default",
              },
            },

            -- enchance Lazy Spec entry format
            lazy = {
              ---@type snacks.picker.format
              format = function(item)
                local a = Snacks.picker.util.align
                local ret = {} ---@type snacks.picker.Highlight[]

                local name =
                  vim.split(item.line:sub(item.pos[2] + 2, item.end_pos[2] - 1), "/")
                ret[#ret + 1] = { a(name[#name], 30), field = "text" }

                local repo
                local lazy_root = require("lazy.core.config").options.root
                if item.file:find(lazy_root) then
                  repo = vim.split(item.file:gsub(lazy_root .. "/", ""), "/")[1]
                else
                  repo = "config"
                end

                local file = vim.split(item.file, "/")

                ret[#ret + 1] = {
                  string.format("%s/…/%s/%s", repo, file[#file - 1], file[#file]),
                  "SnacksPickerDir",
                  virtual = true,
                }

                return ret
              end,
            },
          },
          layouts = {
            -- telescope like layout
            default = {
              layout = {
                box = "horizontal",
                backdrop = false,
                width = 0.8,
                height = 0.8,
                border = "none",
                {
                  box = "vertical",
                  {
                    win = "input",
                    height = 1,
                    border = "rounded",
                    title = "{title} {live} {flags}",
                    title_pos = "center",
                  },
                  {
                    win = "list",
                    title = "Results",
                    title_pos = "center",
                    border = "rounded",
                  },
                },
                {
                  win = "preview",
                  title = "Preview",
                  width = 0.55,
                  border = "rounded",
                  title_pos = "center",
                },
              },
            },
            vertical = {
              layout = {
                box = "vertical",
                backdrop = false,
                width = 0.8,
                height = 0.8,
                border = "none",
                {
                  win = "preview",
                  title = "Preview",
                  height = 0.5,
                  border = "rounded",
                  title_pos = "center",
                },
                {
                  win = "input",
                  height = 1,
                  border = "rounded",
                  title = "{title} {live} {flags}",
                  title_pos = "center",
                },
                {
                  win = "list",
                  title = "Results",
                  title_pos = "center",
                  border = "rounded",
                },
              },
            },
            select = {
              preview = false,
              layout = {
                box = "vertical",
                backdrop = false,
                width = 0.5,
                min_width = 40,
                min_height = 12,
                border = "none",
                {
                  win = "input",
                  height = 1,
                  border = "rounded",
                  title = "{title}",
                  title_pos = "center",
                },
                {
                  win = "list",
                  border = "rounded",
                },
              },
            },
          },
        },
      })

      for name, cfg in pairs(require("snacks.picker.config.sources")) do
        -- use 'select' layout instead of 'vscode'
        if cfg.layout and cfg.layout.preset == "vscode" then
          ret.picker.sources[name] = { layout = { preset = "select" } }
        end
      end

      return ret
    end,
  },
}
