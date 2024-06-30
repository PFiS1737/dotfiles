local function cond()
  return vim.uv.cwd():match("blog$")
end

---@type LazySpec
return {
  {
    import = "lazyvim.plugins.extras.formatting.prettier",
    cond = cond,
  },
  {
    import = "lazyvim.plugins.extras.linting.eslint",
    cond = cond,
  },
  {
    import = "lazyvim.plugins.extras.lang.tailwind",
    cond = cond,
  },

  { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "astro" } },
  },

  -- LSP Servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        astro = {},
      },
    },
  },

  {
    "conform.nvim",
    opts = function(_, opts)
      if LazyVim.has_extra("formatting.prettier") then
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft.astro = { "prettier" }
      end
    end,
  },
}
