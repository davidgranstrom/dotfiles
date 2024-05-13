return {
  {
    'justinmk/vim-dirvish',
    keys = {
      { '-' }
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
      { '<leader>fs' }
    },
    config = function()
      vim.keymap.set('n', '<leader>fs', '<cmd>Git<cr>')
    end
  },
  -- 'tpope/vim-repeat',
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
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
    'AckslD/nvim-trevJ.lua',
    config = true,
    keys = {
      { '<leader>l', '<cmd>lua require"trevj".format_at_cursor()<cr>', desc = 'Split function arguments' },
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
}
