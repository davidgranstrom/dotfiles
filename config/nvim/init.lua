vim.g.mapleader = ' '

_G.P = function(...)
  local num = select('#', ...)
  local args = { ... }
  local result = ''
  for i = 1, num do
    result = result .. vim.inspect(args[i])
    if i ~= num then
      result = result .. ' '
    end
  end
  print(result)
end

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('custom/plugins', {
  change_detection = {
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
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
      },
    },
  },
})

vim.cmd.colorscheme 'tokyonight'
vim.cmd [[hi! link EndOfBuffer NonText]]
vim.cmd [[hi! link WinSeparator Function]]
