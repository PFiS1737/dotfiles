if vim.tbl_contains(vim.v.argv, "+Man!") then
  -- use neovim as the man pager
  vim.opt.fillchars = { eob = " " }
else
  require("config.lazy")
end
