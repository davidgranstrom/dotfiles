local setlocal = vim.opt_local

-- Indentation
setlocal.tabstop = 4
setlocal.shiftwidth = 4

vim.keymap.set('n', '<leader>d', '<cmd>Telescope scdoc<cr>', {buffer = true})
