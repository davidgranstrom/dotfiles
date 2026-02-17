return {
  cmd = { 'zls' },
  filetypes = {
    'zig',
  },
  settings = {
    zls = {
      -- Whether to enable build-on-save diagnostics
      -- Further information about build-on save:
      -- https://zigtools.org/zls/guides/build-on-save/
      -- enable_build_on_save = true,

      -- Neovim already provides basic syntax highlighting
      semantic_tokens = 'partial',
    }
  }
}
