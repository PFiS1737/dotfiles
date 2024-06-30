---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.util.project" },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
      silent_chdir = false,
      show_hidden = true,
    },
  },
}
