local map = vim.keymap.set

-- edit init.lua
map('n', '<leader>ev', '<cmd>tabedit $MYVIMRC<cr>')

-- change to current directory
map('n', '<leader>c', '<cmd>cd %:p:h | pwd<cr>')

-- navigate through wrapped text
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- exit insert mode
map('i', 'jk', '<Esc>')

-- save buffer
map({ 'n', 'i' }, '<A-s>', '<cmd>write<cr>')

-- unmap help
map({ 'n', 'i' }, '<F1>', '<Esc>')

-- horizontal scrolling
map('n', '<C-l>', '10zl')
map('n', '<C-h>', '10zh')

-- move to the right in insert mode
map('i', '<C-l>', '<Right>')

-- paste last yanked item
map({ 'n', 'x' }, 'gp', '"0p')

-- edit current buffer in a new tab
map('n', '<leader>z', '<cmd>tabedit!%<cr>')

-- resize windows with arrow-keys
local directions = { 'up', 'right', 'down', 'left' }
local win_cmds = { '+', '>', '-', '<' }
for i = 1, #directions do
  local lhs = string.format('<%s>', directions[i])
  local rhs = string.format('<cmd>3wincmd %s<cr>', win_cmds[i])
  map('n', lhs, rhs, { silent = true })
end

-- never enter Ex mode
map('n', 'Q', '<Nop>')

-- easy renaming
map('n', '<leader>r', '*``cgn')

-- remap esc in terminal mode
map('t', '<Esc>', '<C-\\><C-n>')

-- navigate from terminal buffers
local t_directions = { 'h', 'j', 'k', 'l' }
for _, dir in ipairs(t_directions) do
  local lhs = string.format('<A-%s>', dir)
  local rhs = string.format('<C-\\><C-n><C-w>%s', dir)
  map('t', lhs, rhs, { silent = true })
end

--- unimpaired.vim emulation
--
-- coc (toggle cursor line)
-- cox (toggle cursor line/col)
-- con (toggle numbers)
-- cor (toggle relative numbers)
-- col (toggle listchars)
-- cos (toggle spell)
-- coh (toggle hlsearch)
-- cow (toggle wrap)
-- ]q (quickfix next)
-- [q (quickfix prev)
-- [<space> ([count]line above)
-- ]<space> ([count]line below)

map('n', 'coc', function()
  vim.wo.cursorline = not vim.wo.cursorline
end)

map('n', 'cox', function()
  vim.wo.cursorcolumn = not vim.wo.cursorcolumn
  vim.wo.cursorline = vim.wo.cursorcolumn
end)

map('n', 'con', function()
  vim.wo.number = not vim.wo.number
end)

map('n', 'cor', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end)

map('n', 'cos', function()
  vim.wo.spell = not vim.wo.spell
end)

map('n', 'col', function()
  vim.wo.list = not vim.wo.list
end)

map('n', 'coh', function()
  vim.o.hlsearch = not vim.o.hlsearch
end)

map('n', 'cow', function()
  vim.o.wrap = not vim.o.wrap
end)

map('n', '[<space>', function(c)
  local count = vim.v.count
  vim.cmd(string.format('normal! %dO', count))
end)

map('n', ']<space>', function()
  local count = vim.v.count
  vim.cmd(string.format('normal! %do', count))
end)

map('n', ']q', function()
  vim.cmd [[ cnext ]]
end)

map('n', '[q', function()
  vim.cmd [[ cprev ]]
end)

map('n', ']f', function()
  vim.cmd [[ next ]]
end)

map('n', '[f', function()
  vim.cmd [[ prev ]]
end)

map('n', ']b', function()
  vim.cmd [[ bnext ]]
end)

map('n', '[b', function()
  vim.cmd [[ bprev ]]
end)

map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>o', '<cmd>lua vim.diagnostic.open_float()<CR>')
