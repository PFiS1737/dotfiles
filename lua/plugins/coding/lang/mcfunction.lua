--@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "mcfuncx" } },
    init = function()
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      ---@diagnostic disable-next-line: inject-field
      parser_config.mcfuncx = {
        install_info = {
          url = "https://github.com/PFiS1737/tree-sitter-mcfuncx",
          files = { "src/parser.c" },
        },
        filetype = "mcfuncx",
        maintainers = { "@PFiS1737" },
      }

      vim.treesitter.language.register("mcfuncx", { "mcfuncx", "mcfunction" })
      vim.filetype.add({
        extension = {
          mcfunction = "mcfunction",
          mcfuncx = "mcfuncx",
        },
      })
    end,
  },
}
