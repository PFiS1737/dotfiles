if not vim.g.neovide then
  return {}
end

---@type LazyPluginSpec[]
local M = {}

-- ==================
--      Options
-- ==================

vim.g.neovide_scale_factor = 1
vim.g.neovide_padding_left = 6
vim.g.neovide_underline_stroke_scale = 2
vim.g.neovide_cursor_unfocused_outline_width = 0.1

-- ==================
--    Input Method
-- ==================

local ime_input_group = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  group = ime_input_group,
  pattern = "*",
  callback = function()
    vim.g.neovide_input_ime = true
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "CmdlineLeave" }, {
  group = ime_input_group,
  pattern = "*",
  callback = function()
    vim.g.neovide_input_ime = false
  end,
})

-- ==================
-- kitty like pasting
-- ==================

vim.keymap.set({ "n", "v", "s", "x", "o", "i", "l", "c", "t" }, "<c-s-v>", function()
  vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end, { desc = "Paste", noremap = true, silent = true })

-- ==================
-- kitty like scaling
-- ==================

local timer = 0
local function scale(mode)
  return function()
    -- stylua: ignore
    timer = mode == "up"
      and (timer + 1 > 4 and 4 or timer + 1)
      or mode == "down"
        and (timer - 1 < -4 and -4 or timer - 1)
        or 0
    vim.g.neovide_scale_factor =
      math.pow(timer > 0 and 1.25 or timer < 0 and 0.8 or 1, math.abs(timer))
  end
end

vim.keymap.set(
  { "n", "v", "s", "x", "o", "i", "l", "c", "t" },
  "<C-+>",
  scale("up"),
  { desc = "Scale up", noremap = true, silent = true }
)

vim.keymap.set(
  { "v", "s", "x", "o", "i", "l", "c" },
  "<C-_>",
  scale("down"),
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
        scale("down"),
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
