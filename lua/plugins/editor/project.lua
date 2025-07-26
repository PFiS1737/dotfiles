---@module "lazy"
---@type LazySpec
return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      manual_mode = false,
      silent_chdir = false,
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          objects = {
            dev = {
              "~/Development/repos",
              "~/Development/hello",
              "~/Development/games",
              "~/Development/projects",
            },
          },
        },
      },
    },
  },
}
