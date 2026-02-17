return {
  {
    'justinmk/vim-dirvish',
    keys = {
      { '-' },
    },
  },
  {
    'tpope/vim-abolish',
    cmd = 'S',
  },
  {
    'tpope/vim-fugitive',
    cmd = { 'Gw', 'Gread', 'Gdiffsplit' },
    keys = {
      { '<leader>fs' },
    },
    config = function()
      vim.keymap.set('n', '<leader>fs', '<cmd>Git<cr>')
    end,
  },
  {
    'saghen/blink.indent',
    opts = {
      static = {
        enabled = true,
        char = '│',
        whitespace_char = nil, -- inherits from `vim.opt.listchars:get().space` when `nil` (see `:h listchars`)
        priority = 1,
        highlights = { 'Whitespace' },
      },
      scope = {
        enabled = false,
      },
    },
  },
  {
    'numToStr/Navigator.nvim',
    config = function()
      local map = vim.keymap.set
      require('Navigator').setup()
      map('n', '<A-k>', '<cmd>lua require"Navigator".up()<cr>', { silent = true })
      map('n', '<A-l>', '<cmd>lua require"Navigator".right()<cr>', { silent = true })
      map('n', '<A-j>', '<cmd>lua require"Navigator".down()<cr>', { silent = true })
      map('n', '<A-h>', '<cmd>lua require"Navigator".left()<cr>', { silent = true })
    end,
  },
  { 'j-hui/fidget.nvim', opts = {} },
  {
    dir = '~/code/vim/nvim-markdown-preview',
    ft = 'markdown',
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      use_default_keymaps = false,
    },
    keys = {
      { '<leader>l', '<cmd>lua require("treesj").toggle()<cr>', desc = 'Split code block toggle' },
    },
  },
  {
    'tpope/vim-surround',
    config = function()
      vim.keymap.set('x', 's', '<plug>VSurround')
    end,
  },
  {
    dir = '~/code/vim/oblique-strategies.nvim',
    keys = {
      { '<F9>' },
    },
    opts = {
      keymaps = {
        show = {
          n = '<F9>',
        },
      },
    },
  },
  { dir = '~/code/vim/scnvim-repl', lazy = true },
}
