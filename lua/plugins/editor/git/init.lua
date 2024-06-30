local path = require("utils.path")

---@type LazySpec
return {
  { import = "plugins.editor.git" },
  -- { import = "lazyvim.plugins.extras.lang.git" },
  -- { import = "lazyvim.plugins.extras.util.octo" },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- fixed that `<leader>gc` and `<leader>gs` don't work
      {
        "<leader>gc",
        function()
          require("telescope.builtin").git_commits({ cwd = LazyVim.root.git() })
        end,
        desc = "commits",
      },
      {
        "<leader>gs",
        function()
          require("telescope.builtin").git_status({ cwd = LazyVim.root.git() })
        end,
        desc = "status",
      },
    },
    opts = {
      pickers = {
        git_commits = {
          mappings = {
            i = {
              ["<C-A-d>"] = function()
                local actions = require("telescope.actions")
                local prompt_bufnr = vim.api.nvim_get_current_buf()
                actions.close(prompt_bufnr)

                local selection = require("telescope.actions.state").get_selected_entry()
                vim.cmd("stopinsert")
                vim.api.nvim_command("DiffviewOpen " .. selection.value .. "^!")
              end,
            },
          },
        },
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    keys = {
      {
        "<leader>gf",
        function()
          LazyVim.lazygit({
            cwd = LazyVim.root.git(), -- fixed
            args = {
              "-f",
              path.relative( -- feated
                vim.api.nvim_buf_get_name(0),
                LazyVim.root.git()
              ),
            },
          })
        end,
        desc = "Lazygit current file history",
      },
    },
  },
}
