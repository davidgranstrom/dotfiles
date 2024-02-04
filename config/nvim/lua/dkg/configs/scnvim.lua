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

require('replay').register_injection('scnvim_eval', require('scnvim.editor').send_block)
-- local emptylake = require('scnvim_emptylake')

scnvim.setup {
  ensure_installed = true,
  keymaps = {
    ['<M-e>'] = map('editor.send_line', {'i', 'n'}, { desc = 'Send a line' }),
    -- ['<C-e>'] = map('editor.send_block', {'i', 'n', 'x'}, { flash = true, desc = 'Send a block' }),
    ['<C-e>'] = map(function()
      require('replay').inject('scnvim_eval')
      require('scnvim.editor').send_block()
    end, {'i', 'n'}),
    ['<CR>'] = map('postwin.toggle', 'n', { desc = 'Toggle post window' }),
    ['<M-CR>'] = map('postwin.toggle', 'i'),
    -- ['<M-L>'] = map('postwin.clear', {'n', 'i'}),
    ['<M-L>'] = map(function()
      require('scnvim.postwin').clear()
      -- emptylake.last_col = 0
    end, {'n', 'i'}),
    ['<C-k>'] = map('signature.show', {'n', 'i'}),
    ['<F12>'] = map('sclang.hard_stop', {'n', 'x', 'i'}),
    ['<leader>st'] = map('sclang.start', 'n', { desc = 'Start the interpreter' }),
    ['<leader>sk'] = map('sclang.recompile'),
    ['<F1>'] = map_expr('s.boot', 'n', { desc = 'Boot the server' }),
    -- ['<F2>'] = map_expr('s.meter'),
    ['<leader>sm'] = map_expr('s.meter'),
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
      width = function()
        return vim.o.columns / 2
      end,
      height = function()
        return vim.o.lines - 10
      end,
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
scnvim.load_extension 'level_meter'
-- scnvim.load_extension('logger')
-- scnvim.load_extension('piano')
-- scnvim.load_extension('fzf-sc')
--

-- Remove new lines in postwin output
-- local sclang = require'scnvim.sclang'
-- local postwin = require'scnvim.postwin'
-- local config = require'scnvim.config'
-- local path = require'scnvim.path'

-- local function buf_is_valid()
--   return postwin.buf and vim.api.nvim_buf_is_loaded(postwin.buf)
-- end
-- local last_col = 0

-- -- Always wrap lines in post window
-- postwin.on_open:append(function()
--   vim.opt_local.wrap = true
-- end)

-- sclang.on_output:replace(function(line)
--   if not buf_is_valid() then
--     return
--   end

--   local auto_toggle_error = config.postwin.auto_toggle_error
--   local scrollback = config.postwin.scrollback

--   local found_error = line:match '^ERROR'
--   if found_error and auto_toggle_error then
--     if not postwin.is_open() then
--       postwin.open()
--     end
--   end

--   if path.is_windows then
--     line = line:gsub('\r', '')
--   end

--   vim.api.nvim_buf_set_text(postwin.buf, 0, last_col, 0, last_col, { line })
--   last_col = last_col + #line

--   local num_lines = vim.api.nvim_buf_line_count(postwin.buf)
--   if scrollback > 0 and num_lines > scrollback then
--     vim.api.nvim_buf_set_lines(postwin.buf, 0, 1, true, {})
--     num_lines = vim.api.nvim_buf_line_count(postwin.buf)
--   end

--   if postwin.is_open() then
--     vim.api.nvim_win_set_cursor(postwin.win, { num_lines, last_col })
--   end
-- end)
