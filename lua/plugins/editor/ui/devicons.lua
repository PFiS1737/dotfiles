-- useful tools:
--   https://simpleicons.org
local icons = {
  ["rollup"] = {
    icon = "",
    color = "#EC4A3F",
    name = "Rollup",
  },
  ["babel"] = {
    icon = "",
    color = "#F9DC3E",
    name = "Babel",
  },
}

---@type LazySpec
return {
  {
    "mini.icons",
    enabled = false,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        ["rollup.config.js"] = icons["rollup"],
        ["rollup.config.mjs"] = icons["rollup"],
        ["rollup.config.cjs"] = icons["rollup"],
        ["rollup.config.ts"] = icons["rollup"],
        ["babel.config.js"] = icons["babel"],
        ["babel.config.mjs"] = icons["babel"],
        ["babel.config.cjs"] = icons["babel"],
        ["babel.config.ts"] = icons["babel"],
      },
    },
  },
}
