return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'c',
        'cpp',
        'c_sharp',
        'zig',
        'lua',
        'html',
        'javascript',
        'css',
        'scss',
        'tsx',
        'typescript',
        'json',
        'yaml',
        'fennel',
        'dockerfile',
        'query',
        'cmake',
        'gdscript',
        'markdown',
        'vimdoc',
        -- 'supercollider',
      },
      -- indent = {
      --   enable = true,
      -- },
      highlight = {
        enable = true,
        disable = {},
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<Enter>',
          node_incremental = '<Enter>',
          node_decremental = '<BS>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>sw'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>sW'] = '@parameter.inner',
          },
        },
      },
    }
  end,
}
