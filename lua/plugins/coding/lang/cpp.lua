---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.clangd" },
  { import = "lazyvim.plugins.extras.lang.cmake" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          on_attach = function()
            local cwd = LazyVim.root()
            local dap = require("dap")

            local file = io.open(cwd .. "/CMakeLists.txt", "r")
            if not file then
              return
            end

            local executable_names = {}
            for line in file:lines() do
              local name = line:match("add_executable%((%S+)%s")
              if name then
                vim.list_extend(executable_names, { name })
              end
            end

            file:close()

            for _, lang in ipairs({ "c", "cpp" }) do
              for _, name in ipairs(executable_names) do
                vim.list_extend(dap.configurations[lang], {
                  {
                    type = "codelldb",
                    request = "launch",
                    name = "Launch cmake executable `" .. name .. "`",
                    program = cwd .. "/build/" .. name,
                    cwd = cwd,
                  },
                })
              end
            end
          end,
        },
      },
    },
  },
}
