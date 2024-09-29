local ft = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescript.tsx",
  "typescriptreact",
  "json",
  "jsonc",
  "css",
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
      opts.formatters = {
        ["biome-check"] = {
          -- HACK: disable stdin mode before next verison, since [#4102](https://github.com/biomejs/biome/issues/4102)
          args = { "check", "--write", "$FILENAME" },
          stdin = false,
        },
      }

      for _, f in ipairs(ft) do
        opts.formatters_by_ft[f] = { "biome-check" }
      end
    end,
  },
}
