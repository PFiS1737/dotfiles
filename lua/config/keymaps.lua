-- Default keymaps: lazyvim.config.keymaps

local map = vim.keymap.set

local defer = require("utils.defer")

--- Scroll only one line for mouse wheel events to get smooth scrolling on touch screens
--- From /usr/share/nvim/sysinit.vim
--- Disabled
-- map("n", "<ScrollWheelUp>", "<C-Y>")
-- map("i", "<ScrollWheelUp>", "<C-X><C-Y>")
-- map("n", "<ScrollWheelDown>", "<C-E>")
-- map("i", "<ScrollWheelDown>", "<C-X><C-E>")

if vim.g.user_scroll_throttle then
  map(
    { "n", "i", "v", "o", "t" },
    "<ScrollWheelDown>",
    defer.throttle(function()
      local key = vim.api.nvim_replace_termcodes("<ScrollWheelDown>", true, false, true)
      vim.api.nvim_feedkeys(key, "n", false)
    end, vim.g.user_scroll_throttle_delay)
  )
  map(
    { "n", "i", "v", "o", "t" },
    "<ScrollWheelUp>",
    defer.throttle(function()
      local key = vim.api.nvim_replace_termcodes("<ScrollWheelUp>", true, false, true)
      vim.api.nvim_feedkeys(key, "n", false)
    end, vim.g.user_scroll_throttle_delay)
  )
end
