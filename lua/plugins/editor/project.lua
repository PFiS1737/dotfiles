---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.util.project" },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      silent_chdir = false,
    },
  },
}
