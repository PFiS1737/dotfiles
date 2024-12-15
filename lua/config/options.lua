-- Default options: lazyvim.config.options

-- local opt = vim.opt

if vim.env.TERMUX_VERSION ~= nil then
  vim.g.user_scroll_throttle = true
  vim.g.user_scroll_throttle_delay = 20
end

vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_blink_main = true
