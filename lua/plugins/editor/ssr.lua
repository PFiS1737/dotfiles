-- INFO: You can write a comment like `// add($a, $b) ==>> $a.add($b)` and run it as
--       a code action in rust.

---@module "lazy"
---@type LazySpec
return {
  {
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>sR",
        function()
          require("ssr").open()
        end,
        desc = "Structural search and replace",
        mode = { "n", "x" },
      },
    },
    opts = {
      keymaps = {
        next_match = "]",
        prev_match = "[",
      },
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>sR", false },
      {
        "<leader>s<c-r>",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
    },
  },
}
