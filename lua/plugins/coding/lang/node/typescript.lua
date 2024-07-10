---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "typescript", "tsx" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = require("config.lsp.vtsls"),
          -- handlers = {
          --   ["textDocument/publishDiagnostics"] = function(err, res, ctx, config)
          --     local codes = {
          --       7044, -- Parameter 'xxx' implicitly has an 'any' type
          --       7045, -- Member 'xxx' implicitly has an 'any[]' type
          --       7047, -- Rest parameter 'xxx' implicitly has an 'any[]' type
          --     }
          --
          --     local filtered = {}
          --     for _, diag in ipairs(res.diagnostics) do
          --       if not (diag.source == "ts" and vim.tbl_contains(codes, diag.code)) then
          --         -- print(diag.code)
          --         table.insert(filtered, diag)
          --       end
          --     end
          --
          --     res.diagnostics = filtered
          --     vim.lsp.diagnostic.on_publish_diagnostics(err, res, ctx, config)
          --   end,
          -- },
        },
      },
    },
  },
}
