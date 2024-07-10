---@type LazySpec
return {
  { import = "plugins.coding.lang.node" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  {
    "b0o/SchemaStore.nvim",
    init = function()
      vim.filetype.add({
        filename = {
          [".swcrc"] = "json",
        },
      })
    end,
  },
}
