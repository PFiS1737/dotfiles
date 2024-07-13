local terminal = require("utils.terminal")

---@type LazySpec
return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      {
        "<leader>ft",
        function()
          terminal.toggle_float(LazyVim.root.get())
        end,
        desc = "Floating terminal (root dir)",
      },
      {
        "<leader>fT",
        function()
          terminal.toggle_float()
        end,
        desc = "Floating terminal (cwd)",
      },
      {
        "<leader>f<c-t>h",
        function()
          terminal.toggle_horizontal(LazyVim.root.get())
        end,
        desc = "Horizontal terminal (root dir)",
      },
      {
        "<leader>f<c-t>s",
        function()
          terminal.send_lines("single_line", true)
        end,
        desc = "Send current line to terminal",
      },
      {
        "<leader>f<c-t>ss",
        function()
          terminal.send_lines("visual_selection", false)
        end,
        desc = "Send selection to terminal",
        mode = "v",
      },
      {
        "<leader>f<c-t>sl",
        function()
          terminal.send_lines("visual_lines", true)
        end,
        desc = "Send lines to terminal",
        mode = "v",
      },

      -- override
      {
        "<C-_>", -- as well as <C-/>
        "<leader>ft",
        desc = "Terminal (root dir)",
        remap = true,
      },
    },
    opts = {
      float_opts = {
        border = "single",
        width = function()
          return math.floor(vim.o.columns * 0.9)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.9)
        end,
      },
      -- on_open = function()
      --   vim.cmd.startinsert()
      -- end,
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>f<c-t>", group = "terminal" },
        -- { "<leader>ts", group = "send to terminal" },
      },
    },
  },
}
