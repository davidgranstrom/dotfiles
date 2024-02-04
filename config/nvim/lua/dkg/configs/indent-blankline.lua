require'ibl'.setup {
  scope = {
    enabled = false
  },
  indent = {
    char = '│'
  },
  exclude = {
    filetypes = {
      'terminal',
      'packer',
      'scnvim',
      'git',
      'markdown',
      'fennel',
      'text',
    }
  }
}
