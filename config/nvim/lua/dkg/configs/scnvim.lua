local map = vim.keymap.set

map('n', '<leader>st', '<cmd>SCNvimStart<cr>')
map('n', '<leader>sk', '<Plug>(scnvim-recompile)')
map('n', '<leader>sn', '<cmd>lua sc_scratchpad_new()<cr>')

vim.g.scnvim_echo_args = 1
vim.g.scnvim_scdoc = 1
