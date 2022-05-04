local map = vim.keymap.set
local scnvim = require'scnvim'

-- scnvim.setup{}

map('n', '<leader>st', '<cmd>SCNvimStart<cr>')
map('n', '<leader>sk', '<Plug>(scnvim-recompile)')
map('n', '<leader>sn', '<cmd>lua sc_scratchpad_new()<cr>')
vim.g.scnvim_echo_args = 0
vim.g.scnvim_scdoc = 1
