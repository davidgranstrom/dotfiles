-- Filetype lua opt-in

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- Disable builtin plugins to reduce startup time

vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1

local builtins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'tar',
  'tarPlugin',
  'zip',
  'zipPlugin',
  '2html_plugin',
  'python3_provider',
  'python_provider',
  'ruby_provider',
  'perl_provider',
  'node_provider',
}

for _, builtin in ipairs(builtins) do
  vim.g['loaded_' .. builtin] = 1
end
