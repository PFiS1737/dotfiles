---@module "lazy"
---@type LazySpec
return {
  {
    "sindrets/diffview.nvim",
    keys = {
      { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview: status" },
      {
        "<leader>gH",
        "<cmd>DiffviewFileHistory<cr>",
        desc = "Diffview: git log",
      },
      {
        "<leader>g<c-h>",
        "<cmd>DiffviewFileHistory %<cr>",
        desc = "Diffview: file history",
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
          "<c-q>",
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
            { "n", "<c-q>", actions.close, { desc = "Close diffview" } },
          },
          file_panel = panel_keymaps,
          file_history_panel = panel_keymaps,
        },
      }
    end,
  },
}
