return {
  assist = {
    preferSelf = true,
  },
  cargo = {
    allFeatures = true,
    loadOutDirsFromCheck = true,
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
  files = {
    exclude = {
      ".direnv",
      ".git",
      ".jj",
      ".github",
      ".gitlab",
      "bin",
      "node_modules",
      "target",
      "venv",
      ".venv",
    },
    -- Avoid Roots Scanned hanging, see https://github.com/rust-lang/rust-analyzer/issues/12613#issuecomment-2096386344
    watcher = "client",
  },
}
