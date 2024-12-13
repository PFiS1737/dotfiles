---@type LazySpec
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_c = {
        LazyVim.lualine.root_dir({
          ---@diagnostic disable-next-line: assign-type-mismatch
          parent = false,
          color = { fg = Snacks.util.color("Special") },
          icon = "󱉭", -- fix repeated spaces
        }),
        {
          "filetype",
          icon_only = true,
          separator = "",
          padding = { left = 1, right = 0 },
        },
        {
          LazyVim.lualine.pretty_path({ relative = "root" }),
          padding = { left = 0, right = 1 },
        },
        {
          "diagnostics",
          symbols = {
            error = LazyVim.config.icons.diagnostics.Error,
            warn = LazyVim.config.icons.diagnostics.Warn,
            info = LazyVim.config.icons.diagnostics.Hint,
            hint = LazyVim.config.icons.diagnostics.Info,
          },
        },
      }
    end,
  },
}
