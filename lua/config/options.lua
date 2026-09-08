-- Default options: lazyvim.config.options

-- ==================
--   Lazyvim Config
-- ==================

vim.g.lazyvim_check_order = false
vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_blink_main = true

-- ==================
--   Neovim Options
-- ==================

local opt = vim.opt

-- add left padding
opt.statuscolumn = [[%!' '..v:lua.require'snacks.statuscolumn'.get()]]
