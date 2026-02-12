--
--
--         ███▄    ███▒   █▓██▓███▄ ▄███▓
--         ██ ▀█   ▓██░   █▓██▓██▒▀█▀ ██▒
--        ▓██  ▀█ ██▓██  █▒▒██▓██    ▓██░
--        ▓██▒  ▐▌██▒▒██ █░░██▒██    ▒██
--        ▒██░   ▓██░ ▒▀█░ ░██▒██▒   ░██▒
--        ░ ▒░   ▒ ▒  ░ ▐░ ░▓ ░ ▒░   ░  ░
--        ░ ░░   ░ ▒░ ░ ░░  ▒ ░  ░      ░
--           ░   ░ ░    ░░  ▒ ░      ░
--                 ░     ░  ░        ░
--                      ░
--

if vim.g.vscode then
  local map = vim.keymap.set
  map('i', 'jk', '<Esc>')
  map('n', '<C-l>', '10zl')
  map('n', '<C-h>', '10zh')
  map({ 'n', 'x' }, 'gp', '"0p')
  map('i', '<C-l>', '<Right>')
  return
end

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

vim.g.mapleader = ' '

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

-- Don't load providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

require('lazy').setup('custom/plugins', {
  change_detection = {
    notify = false,
  },
  ui = {
    border = 'single',
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'netrw',
        'netrwPlugin',
        'gzip',
        'tar',
        'tarPlugin',
        'zip',
        'zipPlugin',
        'tohtml',
        'tutor',
      },
    },
  },
})

-- vim.lsp.config('*', {
--   on_attach = function(_, bufnr)
--     print('hello from client')
--   end,
-- })
-- vim.lsp.enable({'clangd'})

vim.cmd.colorscheme 'cyberdream'
vim.cmd [[hi! link EndOfBuffer NonText]]
vim.cmd [[hi WinSeparator guifg=Black]]
-- vim.cmd [[hi! link StatusLine TabLineSel]]
vim.cmd [[hi StatusLine guibg=#16181a]]
vim.cmd [[hi StatusLineNC guibg=#16181a]]
vim.opt.fillchars:append 'eob:~'

-- vim.cmd.colorscheme 'tokyonight'
-- vim.cmd [[hi! link EndOfBuffer NonText]]
-- vim.cmd [[hi! link WinSeparator Function]]
