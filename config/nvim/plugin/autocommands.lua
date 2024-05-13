local statusline = require 'custom.statusline'

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  callback = statusline.active,
})

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  callback = statusline.tabline,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  callback = statusline.inactive,
})

local function jump_to_last_position()
  local last_curpos = vim.fn.line '\'"'
  local last_line = vim.fn.line '$'
  local ft = vim.api.nvim_get_option_value('filetype', {})
  local in_range = last_curpos >= 1 and last_curpos <= last_line
  local is_valid_filetype = ft ~= 'commit' and ft ~= 'rebase'
  if in_range and is_valid_filetype then
    vim.cmd [[normal! g`"]]
  end
end

vim.api.nvim_create_autocmd('BufRead', {
  desc = 'Jump to last cursor position when opening a buffer',
  callback = jump_to_last_position,
  once = true,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 80 }
  end,
})

-- Filetype specific autocommands

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.h', '*.c' },
  command = 'set filetype=c',
})

-- vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
--   pattern = '*.sc',
--   command = 'setlocal noexpandtab',
-- })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cs',
  command = 'setlocal tabstop=4 softtabstop=4 shiftwidth=4',
})

local markdown_ = function()
  vim.opt_local.commentstring = '<!--%s-->'
  vim.keymap.set('i', '.', '.<c-g>u', { buffer = true })
  vim.keymap.set('i', '?', '?<c-g>u', { buffer = true })
  vim.keymap.set('i', '!', '!<c-g>u', { buffer = true })
  vim.keymap.set('i', ',', ',<c-g>u', { buffer = true })
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = markdown_,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'javascript.jsx',
--   command = 'setlocal filetype=javascript',
-- })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  command = 'setlocal ts=4 sts=4 sw=4',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cmake',
  command = 'setlocal commentstring=#%s',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  command = 'setlocal spell | setlocal spelllang=en',
})
