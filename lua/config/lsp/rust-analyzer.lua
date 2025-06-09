return {
  cargo = {
    allFeatures = true,
    loadOutDirsFromCheck = true,
    buildScripts = {
      enable = true,
    },
  },
  checkOnSave = true,
  procMacro = {
    enable = true,
  },
  diagnostics = {
    experimental = {
      enable = true,
    },
    styleLints = {
      enable = true,
    },
  },
}
