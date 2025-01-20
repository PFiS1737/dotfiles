return {
  workspace = {
    checkThirdParty = false,
  },
  diagnostics = {
    -- globals = { "vim" },
    workspaceDelay = 100,
  },
  codeLens = {
    enable = false,
  },
  completion = {
    callSnippet = "Replace",
  },
  runtime = {
    version = "LuaJIT",
  },
  doc = {
    privateName = { "^_" },
  },
  hint = {
    enable = true,
    setType = false,
    paramType = true,
    await = true,
    paramName = "All",
    semicolon = "SameLine",
    arrayIndex = "Disable",
  },
}
