local scnvim = require'scnvim'
local map = scnvim.map

local map_expr = function(expr, modes)
  modes = modes or {'n', 'x', 'i'}
  return scnvim.map(function()
    scnvim.send(expr)
  end, modes)
end

scnvim.setup {
  mapping = {
    ['<M-e>'] = map.send_line({'i', 'n'}),
    ['<C-e>'] = {
      map.send_block({'i', 'n'}),
      map.send_selection('x'),
    },
    ['<CR>'] = map.postwin_toggle(),
    ['<M-CR>'] = map.postwin_toggle('i'),
    ['<M-L>'] = map.postwin_clear({'n', 'i'}),
    ['<C-k>'] = map.show_signature({'n', 'i'}),
    ['<F12>'] = map.hard_stop({'n', 'x', 'i'}),
    ['<leader>st'] = map(scnvim.start),
    ['<leader>sk'] = map(scnvim.recompile),
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
    float = {
      enabled = true,
    },
  },
}

vim.keymap.set('n', '<leader>sn', sc_scratchpad_new)

scnvim.load_extension('logger')
scnvim.load_extension('piano')
