local sorters = require'telescope.sorters'
local previewers = require'telescope.previewers'
local telescope = require'telescope'

telescope.setup{
  defaults = {
    color_devicons = true,
    file_sorter = sorters.get_fzy_sorter,
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
  },
}

-- use fzf sorter
telescope.load_extension 'fzf'
telescope.load_extension 'scdoc'

local cmd = '<cmd>Telescope %s<cr>'
local providers = {
  {'<leader>t', 'git_files'},
  {'<leader>b', 'buffers'},
  {'<leader>g', 'live_grep'},
  {'<leader>i', 'grep_string'},
}

for _, provider in ipairs(providers) do
  local map, action = unpack(provider)
  vim.keymap.set('n', map, string.format(cmd, action))
end
