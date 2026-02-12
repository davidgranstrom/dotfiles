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
  {
    dir = '~/code/vim/scnvim-repl',
  },
  -- {
  --   dir = '~/code/vim/timber.nvim',
  --   event = 'VeryLazy',
  --   config = function()
  --     require('timber').setup({
  --       -- Configuration here, or leave empty to use defaults
  --     })
  --   end
  -- },
}
