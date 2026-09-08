return {
  cargo = {
    buildScripts = {
      enable = true,
    },
  },
  checkOnSave = true,
  diagnostics = {
    enable = true,
    experimental = {
      enable = true,
    },
    styleLints = {
      enable = true,
    },
  },
  procMacro = {
    enable = true,
  },
  references = {
    excludeImports = true,
  },
}
