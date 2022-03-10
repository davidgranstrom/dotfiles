local map = vim.keymap.set
require'neogen'.setup{
  enabled = true,
}
map('n', '<leader>d', '<cmd>lua require"neogen".generate()<cr>', {silent = true})
