---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = require("config.lsp.lua"),
          },
        },
      },
    },
  },
}
