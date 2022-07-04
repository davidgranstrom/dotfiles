local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr

scnvim.setup {
  ensure_installed = true,
  keymaps = {
    ['<M-e>'] = map('editor.send_line', {'i', 'n'}),
    ['<C-e>'] = {
      map('editor.send_block', {'i', 'n'}),
      map('editor.send_selection', 'x'),
    },
    ['<CR>'] = map('postwin.toggle'),
    ['<M-CR>'] = map('postwin.toggle', 'i'),
    ['<M-L>'] = map('postwin.clear', {'n', 'i'}),
    ['<C-k>'] = map('signature.show', {'n', 'i'}),
    ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
    ['<leader>st'] = map('sclang.start'),
    ['<leader>sk'] = map('sclang.recompile'),
    ['<F1>'] = map_expr('s.boot'),
    ['<F2>'] = map_expr('s.meter'),
  },
  editor = {
    highlight = {
      color = 'IncSearch',
      type = 'flash',
    },
  },
  documentation = {
    cmd = '/opt/homebrew/bin/pandoc',
  },
  postwin = {
    keymaps = {
      q = map('postwin.close')
    },
    float = {
      enabled = true,
    },
  },
  extensions = {
    ['fzf-sc'] = {
      search_plugin = 'nvim-fzf',
    },
    tmux = {
      cmd = 'scnvim-tmux.sh',
      args = { '$1' },
    }
  }
}

vim.keymap.set('n', '<leader>sn', sc_scratchpad_new)

scnvim.load_extension 'tmux'
-- scnvim.load_extension('logger')
-- scnvim.load_extension('piano')
-- scnvim.load_extension('fzf-sc')
