local setlocal = vim.opt_local

setlocal.cinoptions = 'l1'
setlocal.commentstring = [[// %s]]

vim.keymap.set('n', '<leader>a', '<cmd>ClangdSwitchSourceHeader<cr>', {buffer = true})

-- Delete doxygen comments and insert function body.
function remove_doxygen()
  vim.cmd [[ g/^\s*\*\|\/\*/d ]]
  vim.cmd [[ g/;/execute "normal! $xo{\<cr>}" ]]
end
