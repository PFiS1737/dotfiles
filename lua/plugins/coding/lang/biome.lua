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
  "html",
}

---@module "lazy"
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- enable the biome lsp server
        biome = {
          -- prefer to use biome from the local node_modules
          mason = false,
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, f in ipairs(ft) do
        opts.formatters_by_ft[f] = { "biome-check" }
      end

      opts.formatters = opts.formatters or {}
      opts.formatters["biome-check"] = {
        require_cwd = true,
      }
    end,
  },
}
