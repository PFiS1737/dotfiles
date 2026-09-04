---@module "lazy"
---@type LazySpec
return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bj", false }, -- remove the default keymap for picking buffers
      { "gb", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
    },
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "Files",
            highlight = "Directory",
            text_align = "center",
          },
          {
            filetype = "DiffviewFiles",
            text = "Source Control",
            text_align = "center",
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)

      vim.api.nvim_set_hl(
        0,
        "BufferLineIndicatorSelected",
        { link = "BufferLineTabSelected" }
      )
    end,
  },
}
