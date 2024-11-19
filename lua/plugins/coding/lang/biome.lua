local ft = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescript.tsx",
  "typescriptreact",
  "json",
  "jsonc",
  "css",
  "graphql",
}

---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- use the biome lsp server
        biome = {
          -- prefer to use biome from the local node_modules
          cmd = { "./node_modules/.bin/biome", "lsp-proxy" },
          filetypes = ft,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      for _, f in ipairs(ft) do
        opts.formatters_by_ft[f] = { "biome-check" }
      end
    end,
  },
}
