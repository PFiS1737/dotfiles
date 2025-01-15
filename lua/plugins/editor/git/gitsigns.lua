---@type LazySpec
return {
  {
    "lewis6991/gitsigns.nvim",
    keys = function()
      local gitsigns = require("gitsigns")

      return {
        {
          "<leader>uB",
          gitsigns.toggle_current_line_blame,
          desc = "Toggle line blame (by gitsigns)",
        },

        -- Navigation
        {
          "]h",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end,
          desc = "Next Hunk",
        },
        {
          "[h",
          function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end,
          desc = "Prev Hunk",
        },
        {
          "]H",
          function()
            gitsigns.nav_hunk("last")
          end,
          desc = "Last Hunk",
        },
        {
          "[H",
          function()
            gitsigns.nav_hunk("first")
          end,
          desc = "First Hunk",
        },

        -- Text objects
        {
          "ah",
          ":<C-U>Gitsigns select_hunk<CR>",
          desc = "This Hunk (by gitsigns)",
          mode = { "o", "x" },
        },
        {
          "ih",
          ":<C-U>Gitsigns select_hunk<CR>",
          desc = "This Hunk (by gitsigns)",
          mode = { "o", "x" },
        },

        -- Actions
        {
          "<leader>ghb",
          function()
            gitsigns.blame_line({ full = true })
          end,
          desc = "Blame Line",
        },
        {
          "<leader>ghB",
          function()
            gitsigns.blame()
          end,
          desc = "Blame Buffer",
        },
        {
          "<leader>gb",
          function() end, -- disable line blame provide by LazyVim
          desc = "which_key_ignore",
        },
      }
    end,
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 50,
      },
      on_attach = function(buffer)
        local gitsigns = require("gitsigns")

        local map = require("utils.keymap").create_map_for(buffer)

        map("n", "<leader>ghs", gitsigns.stage_hunk, "Stage Hunk")
        map("n", "<leader>ghu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghr", gitsigns.reset_hunk, "Reset Hunk")
        -- map("v", "<leader>ghs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk")
        -- map("v", "<leader>ghr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk")

        map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghR", gitsigns.reset_buffer, "Reset Buffer")

        map("n", "<leader>ghp", gitsigns.preview_hunk_inline, "Preview Hunk Inline")

        -- I use diffview plugin
        -- map("n", "<leader>ghd", gitsigns.diffthis, "Diff This")
        -- map("n", "<leader>ghD", function() gitsigns.diffthis("~") end, "Diff This ~")
      end,
    },
  },
}
