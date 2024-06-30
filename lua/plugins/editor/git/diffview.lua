---@type LazySpec
return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
      {
        "<leader>gH",
        "<cmd>DiffviewFileHistory<cr>",
        desc = "Open file history (current branch)",
      },
      {
        "<leader>g<C-H>",
        "<cmd>DiffviewFileHistory %<cr>",
        desc = "Open file history (current file)",
      },
    },
    opts = function()
      local actions = require("diffview.actions")

      local panel_keymaps = {
        {
          "n",
          "<leader>e",
          actions.toggle_files,
          { desc = "Toggle file panel" },
        },
        { "n", "q", actions.close, { desc = "Close the file panel" } },
        {
          "n",
          "<C-Q>",
          function()
            actions.close()
            actions.close()
          end,
          { desc = "Close diffview" },
        },
      }

      return {
        keymaps = {
          view = {
            -- exchange the `<leader>b` and `<leader>e` actions
            {
              "n",
              "<leader>b",
              actions.focus_files,
              { desc = "Bring focus to the file panel" },
            },
            {
              "n",
              "<leader>e",
              actions.toggle_files,
              { desc = "Toggle file panel" },
            },
            { "n", "<C-Q>", actions.close, { desc = "Close diffview" } },
          },
          file_panel = panel_keymaps,
          file_history_panel = panel_keymaps,
        },
      }
    end,
  },
}
