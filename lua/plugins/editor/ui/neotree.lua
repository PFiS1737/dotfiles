local utils = require("utils.neotree")

---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- keys = function(_, keys)
    --   for i, key in ipairs(keys) do
    --     if key[1] == "<leader>fe" then
    --       keys[i][2] = function()
    --         require("neo-tree.command").execute({
    --           toggle = true,
    --           dir = LazyVim.root(),
    --           position = "float", -- added this
    --         })
    --       end
    --     end
    --   end
    --
    --   return keys
    -- end,
    opts = {
      filesystem = {
        window = {
          mappings = {
            ["O"] = "toggle_node",
            ["F"] = "filter_on_submit",
            -- ["<c-t>"] = "close_all_nodes",

            -- better move
            ["<left>"] = "move_left",
            ["<right>"] = "set_root",

            -- telescope
            ["f"] = "telescope_find",
            ["g"] = "telescope_grep",
          },
        },
        commands = {
          telescope_find = utils.telescope("find_files"),
          telescope_grep = utils.telescope("live_grep"),
          move_left = function(state)
            require("neo-tree.sources.common.commands").close_all_subnodes(state)
            require("neo-tree.sources.filesystem.commands").navigate_up(state)
          end,
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          -- hide_by_name = {
          --   "node_modules"
          -- },
          -- always_show = {
          --   ".gitignore",
          --   ".github",
          --   ".git"
          -- }
        },
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
      nesting_rules = {
        ["npm"] = {
          pattern = "^package%.json$",
          files = { "package-lock.json", "pnpm-lock.yaml" },
        },
        ["corgo"] = {
          pattern = "^Cargo.toml$",
          files = { "Cargo.lock" },
        },
        ["js"] = {
          pattern = "^(.+)%.js$",
          files = { "%1.js.map", "%1.min.js" },
        },
        ["ts"] = {
          pattern = "^(.+)%.ts$",
          files = { "%1.ts.map", "%1.d.ts.map" },
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            modified = "",
            added = "",
            deleted = "",
            renamed = "",
            ignored = "",
            untracked = "", -- "",
            unstaged = "", -- "",
            staged = "", -- "",
            conflict = "", -- "",
          },
        },
        file_size = { enabled = false },
        type = { enabled = false },
        last_modified = { enabled = false },
        created = { enabled = false },
        symlink_target = { enabled = false },
      },
      renderers = {
        directory = {
          { "indent" },
          { "icon" },
          -- { "current_filter" },
          {
            "container",
            content = {
              { "name", zindex = 10 },
              { "clipboard", zindex = 10 },
              -- { "symlink_target", zindex = 10 },
              {
                "diagnostics",
                errors_only = true,
                zindex = 20,
                align = "right",
                hide_when_expanded = true,
              },
              {
                "git_status",
                zindex = 20,
                align = "right",
                hide_when_expanded = true,
              },
            },
          },
        },
        file = {
          { "indent" },
          { "icon" },
          {
            "container",
            content = {
              { "name", zindex = 10 },
              { "clipboard", zindex = 10 },
              -- { "symlink_target", zindex = 10 },
              { "bufnr", zindex = 10 },
              { "modified", zindex = 20, align = "right" },
              { "diagnostics", zindex = 20, align = "right" },
              { "git_status", zindex = 20, align = "right" },
            },
          },
        },
      },
    },
  },
}
