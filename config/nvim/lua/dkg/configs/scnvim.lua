local scnvim = require 'scnvim'
local map = scnvim.map
local map_expr = scnvim.map_expr

local function get_pandoc_path()
  local sysname = require('scnvim.path').get_system()
  if sysname == 'linux' then
    return '/bin/pandoc'
  elseif sysname == 'macos' then
    return '/opt/homebrew/bin/pandoc'
  else
    return '/opt/homebrew/bin/pandoc'
  end
end

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

-- vim.cmd [[ autocmd BufEnter scnvim setlocal wrap ]]
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'scnvim',
--   callback = function(data)
--     print('postwin!', P(data))
--     vim.opt_local.wrap = true
--   end
-- })

-- require('scnvim.postwin').on_open:append(function()
--   vim.opt_local.wrap = true
-- end)

vim.keymap.set('n', '<leader>sn', sc_scratchpad_new)

-- scnvim.load_extension 'tmux'
-- scnvim.load_extension('logger')
-- scnvim.load_extension('piano')
-- scnvim.load_extension('fzf-sc')
