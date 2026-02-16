return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { dir = '~/code/vim/telescope-scdoc' },
  },
  cmd = 'Telescope',
  keys = {
    { '<leader>t' },
    { '<leader>b' },
    { '<leader>g' },
    { '<leader>i' },
    { '<leader>y' },
  },
  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local sorters = require 'telescope.sorters'
    local previewers = require 'telescope.previewers'

    telescope.setup {
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
      { '<leader>t', 'git_files' },
      { '<leader>b', 'buffers' },
      { '<leader>g', 'live_grep' },
      { '<leader>i', 'grep_string' },
    }

    for _, provider in ipairs(providers) do
      local map, action = unpack(provider)
      vim.keymap.set('n', map, string.format(cmd, action))
    end

    vim.keymap.set(
      'n',
      '<leader>y',
      function()
        builtin.lsp_document_symbols({fname_width = 10, symbol_width = 55 })
      end
    )
  end,
}
