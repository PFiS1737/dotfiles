---@module "lazy"
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            {
              "<leader>ca",
              function()
                require("actions-preview").code_actions()
              end,
              desc = "Code Action",
              mode = { "n", "v" },
              has = "codeAction",
            },
          },
        },
      },
    },
  },
  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
    opts = {
      ---@type snacks.picker.Config
      snacks = {
        preview = function(ctx)
          ctx.item.action:preview(function(preview)
            if preview.cmdline then
              ctx.preview:notify(
                "Please keep `highlight_command` empty to use Snacks' builtin diff preview.",
                "warn"
              )
            elseif preview.syntax ~= "" then
              ctx.item.diff = table.concat(preview.lines, "\n")
              Snacks.picker.preview.diff(ctx)
            else
              ctx.preview:notify(preview.lines[1], "info", { item = true })
            end
          end)
        end,
      },
    },
  },
}
