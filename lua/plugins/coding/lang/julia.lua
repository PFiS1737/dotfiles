---@module "lazy"
---@type LazySpec
return {
  { import = "lazyvim.plugins.extras.lang.julia" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "julia" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        julials = {
          -- INFO: handled by mason-lspconfig
          --
          -- FIXME: need to install LanguageServer.jl by hand
          --
          -- LanguageServer.jl can be installed with `julia` and `Pkg`:
          -- $ julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
          --
          -- To update an existing install, use the following command:
          -- $ julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.update()'
          julia_env_path = "~/.julia/environments/nvim-lspconfig",
        },
      },
    },
  },
}
