---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.toml" },
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
