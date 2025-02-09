-- Default options: lazyvim.config.options

if vim.env.TERMUX_VERSION ~= nil then
  vim.g.user_scroll_throttle = true
  vim.g.user_scroll_throttle_delay = 20
end

-- ==================
--   Lazyvim Config
-- ==================

vim.g.lazyvim_check_order = false
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_blink_main = true

-- ==================
--   Neovim Options
-- ==================

local opt = vim.opt

-- add left padding
opt.statuscolumn = [[%!' '..v:lua.require'snacks.statuscolumn'.get()]]
