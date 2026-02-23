local setlocal = vim.opt_local

setlocal.cinoptions = 'l1'
setlocal.commentstring = [[// %s]]

-- Delete doxygen comments and insert function body.
function remove_doxygen()
  vim.cmd [[ g/^\s*\*\|\/\*/d ]]
  vim.cmd [[ g/;/execute "normal! $xo{\<cr>}" ]]
end
