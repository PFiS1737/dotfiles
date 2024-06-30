local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--depth=1",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
    version = false,
    -- cond = function(self)
    --   local event_has_LazyFile = (
    --     type(self.event) == "table" and vim.tbl_contains(self.event, "LazyFile")
    --     or self.event == "LazyFile"
    --   ) and self[1] ~= "nvim-treesitter/nvim-treesitter"
    --
    --   local is_lualine_or_bufferline = self[1] == "nvim-lualine/lualine.nvim"
    --     or self[1] == "akinsho/bufferline.nvim"
    --
    --   if
    --     vim.tbl_contains(vim.v.argv, "+Man!")
    --     and (event_has_LazyFile or is_lualine_or_bufferline)
    --   then
    --     return false
    --   end
    --
    --   return true
    -- end,
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
