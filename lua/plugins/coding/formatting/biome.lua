---@type LazySpec
return {
  -- INFO: prefer to use biome installed in node_modules
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     if type(opts.ensure_installed) == "table" then
  --       vim.list_extend(opts.ensure_installed, { "biome" })
  --     end
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- use the biome lsp server
        biome = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- use "biome-check" for both formatting and linting
        ["javascript"] = { "biome-check" },
        ["javascriptreact"] = { "biome-check" },
        ["typescript"] = { "biome-check" },
        ["typescript.tsx"] = { "biome-check" },
        ["typescriptreact"] = { "biome-check" },
        ["json"] = { "biome-check" },
        ["jsonc"] = { "biome-check" },
        ["css"] = { "biome-check" },
      },
    },
  },
}
