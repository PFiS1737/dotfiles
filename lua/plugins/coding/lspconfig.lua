---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    -- init = function()
    --   vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment", force = true })
    -- end,
    opts = {
      --- These options are handled by lazyvim
      ---@diagnostic disable-next-line: undefined-doc-name
      ---@type vim.diagnostic.Opts
      diagnostics = {
        update_in_insert = true,
        virtual_text = {
          prefix = "■",
          source = true,
        },
      },
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = true,
      },
    },
  },
}
