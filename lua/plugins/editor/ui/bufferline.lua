---@type LazySpec
return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "gb", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
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
  },
}
