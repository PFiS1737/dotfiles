---@type LazySpec
return {
  {
    "vuki656/package-info.nvim",
    enabled = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    event = { "BufRead package.json" },
    opts = {
      autostart = true,
      hide_up_to_date = true,
      package_manager = "pnpm",
    },
  },
}
