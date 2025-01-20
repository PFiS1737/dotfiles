---@type LazySpec
return {
  {
    "aznhe21/actions-preview.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    event = "LspAttach",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get() or {}

      for i, cfg in ipairs(keys) do
        if cfg[1] == "<leader>ca" then
          keys[i][2] = function()
            require("actions-preview").code_actions()
          end
        end
      end

      require("lazyvim.plugins.lsp.keymaps")._keys = keys
    end,
    opts = {
      telescope = require("telescope.config"),
    },
  },
}
