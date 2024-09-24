return {
  dir = '~/code/vim/scnvim',
  ft = 'supercollider',
  config = function()
    local scnvim = require 'scnvim'
    local map = scnvim.map
    local map_expr = scnvim.map_expr
    scnvim.setup {
      keymaps = {
        ['<M-e>'] = map('editor.send_line', { 'i', 'n' }, { desc = 'Send a line' }),
        ['<C-e>'] = map('editor.send_block', { 'i', 'n', 'x' }, { flash = true, desc = 'Send a block' }),
        ['<CR>'] = map('postwin.toggle', 'n', { desc = 'Toggle post window' }),
        ['<M-CR>'] = map('postwin.toggle', 'i'),
        ['<M-L>'] = map('postwin.clear', { 'n', 'i' }),
        -- ['<C-k>'] = map('signature.show', { 'n', 'i' }),
        ['<F12>'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
        ['<leader>st'] = map('sclang.start', 'n', { desc = 'Start the interpreter' }),
        ['<leader>sk'] = map 'sclang.recompile',
        ['<F1>'] = map_expr('s.boot', 'n', { desc = 'Boot the server' }),
        ['<F2>'] = map_expr 's.meter',
      },
      editor = {
        highlight = {
          color = 'IncSearch',
          type = 'flash',
        },
        signature = {
          float = false,
          auto = false,
        },
      },
      documentation = {
        cmd = '/opt/homebrew/bin/pandoc',
      },
      postwin = {
        keymaps = {
          q = map 'postwin.close',
        },
        float = {
          enabled = true,
          width = function()
            return vim.o.columns / 2
          end,
          height = function()
            return vim.o.lines - 10
          end,
        },
      },
      extensions = {},
    }

    vim.keymap.set('n', '<leader>sn', function()
      sc_scratchpad_new()
    end)
  end,
}
