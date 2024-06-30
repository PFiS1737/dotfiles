---@type LazySpec
return {
  {
    "NeogitOrg/neogit",
    enabled = false, -- prefer to use lazygit
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = { "Neogit" },
    keys = {
      {
        "<leader>g<C-G>",
        "<cmd>Neogit cwd=%:p:h<cr>",
        desc = "Open neogit",
      },
      {
        "<leader>gC",
        "<cmd>Neogit commit cwd=%:p:h<cr>",
        desc = "Open neogit commit popup",
      },
    },
    opts = {
      -- disable_hint = true,
      telescope_sorter = function()
        return require("telescope").extensions.fzf.native_fzf_sorter()
      end,
      status = {
        recent_commit_count = 50,
      },
      signs = {
        -- { CLOSED, OPENED }
        section = { " ", " " }, -- use space as left padding
        item = { " ", " " }, -- use space as left padding
        hunk = { "", "" },
      },
      integrations = {
        telescope = true,
        diffview = true,
      },
    },
  },
}
