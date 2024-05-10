return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'quangnguyen30192/cmp-nvim-tags',
      'onsails/lspkind-nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      local lspkind = require 'lspkind'
      local cmp = require 'cmp'

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
      end

      local next_item = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end

      local prev_item = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end

      cmp.setup {
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        completion = {
          keyword_length = 3,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = false,
        },
        formatting = {
          format = lspkind.cmp_format { preset = 'default', mode = 'symbol_text', maxwidth = 50 },
        },
        mapping = {
          -- ['<C-j>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(next_item, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(prev_item, { 'i', 's' }),
          ['<C-n>'] = cmp.mapping(next_item, { 'i', 's' }),
          ['<C-p>'] = cmp.mapping(prev_item, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'tags' },
          { name = 'path' },
          { name = 'buffer' },
        },
      }
    end,
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
