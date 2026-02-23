return {
  {
    'saghen/blink.cmp',
    event = { "InsertEnter" },
    version = '1.*',
    opts = {
      keymap = { preset = 'super-tab' },
      appearance = {
        nerd_font_variant = 'mono'
      },
      completion = {
        documentation = { auto_show = false },
      },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
        min_keyword_length = 3,
      },
    },
  },
  {
    'danymat/neogen',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = true,
    keys = {
      { '<leader>d', '<cmd>lua require"neogen".generate()<cr>', desc = 'Neogen annotation' },
    },
  },
}
