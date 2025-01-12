if not vim.g.neovide then
  return {}
end

---@type LazyPluginSpec[]
local M = {}

-- ==================
--      Options
-- ==================

vim.g.neovide_underline_stroke_scale = 2.0
vim.g.neovide_cursor_unfocused_outline_width = 0.1

-- ==================
-- kitty like pasting
-- ==================

vim.keymap.set({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<c-s-v>", function()
  vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end, { desc = "Paste", noremap = true, silent = true })

-- ==================
-- kitty like scaling
-- ==================

local function scale(scaler)
  return function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * scaler
  end
end

vim.keymap.set(
  { "n", "v", "s", "x", "o", "i", "l", "c", "t" },
  "<c-+>",
  scale(1.25),
  { desc = "Scale down", noremap = true, silent = true }
)

vim.keymap.set(
  { "v", "s", "x", "o", "i", "l", "c" },
  "<c-_>",
  scale(0.8),
  { desc = "Scale down", noremap = true, silent = true }
)

vim.list_extend(M, {
  {
    "LazyVim/LazyVim",
    -- Make sure to override LazyVim's default keybindings,
    -- which are set by [`LazyVim.safe_keymap_set`]
    keys = {
      {
        "<C-_>",
        scale(0.8),
        desc = "Scale down",
        mode = { "n", "t" },
        remap = true,
      },
    },
  },
})

-- ==================
--    Transparency
-- ==================

local transparency = 25

vim.opt.winblend = transparency
vim.opt.pumblend = transparency
vim.list_extend(M, {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        winblend = transparency,
      },
    },
  },
  {
    "saghen/blink.cmp",
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      completion = {
        menu = {
          winblend = transparency,
        },
        documentation = {
          window = {
            winblend = transparency,
          },
        },
      },
      signature = {
        window = {
          winblend = transparency,
        },
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        notification = {
          wo = {
            winblend = transparency,
          },
        },
      },
    },
  },
  -- {
  --   "akinsho/toggleterm.nvim",
  --   opts = {
  --     float_opts = {
  --       winblend = transparency,
  --     },
  --   },
  -- },
})

-- ==================
--        END
-- ==================

return M
