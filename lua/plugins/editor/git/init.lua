---@type LazySpec
return {
  { import = "plugins.editor.git" },
  { import = "lazyvim.plugins.extras.lang.git" },
  -- { import = "lazyvim.plugins.extras.util.octo" },
  {
    "nvim-telescope/telescope.nvim",
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
}
