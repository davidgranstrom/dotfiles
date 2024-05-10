return {
  'lukas-reineke/indent-blankline.nvim',
  opts = {
    scope = {
      enabled = false,
    },
    indent = {
      char = '│',
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
      },
    },
  },
}
