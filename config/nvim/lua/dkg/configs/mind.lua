require('mind').setup {
  keymap = {
    normal = {
      ['<cr>'] = 'open_data',
      ['<tab>'] = 'toggle_node',
      ['<s-tab>'] = 'toggle_node',
      ['/'] = 'select_path',
      I = 'add_inside_start',
      i = 'add_inside_end',
      d = 'delete',
      O = 'add_above',
      o = 'add_below',
      q = 'quit',
      r = 'rename',
      R = 'change_icon',
      u = 'make_url',
      x = 'select',
    },

    selection = {
      ['<cr>'] = 'open_data',
      ['<s-tab>'] = 'toggle_node',
      ['/'] = 'select_path',
      I = 'move_inside_start',
      i = 'move_inside_end',
      O = 'move_above',
      o = 'move_below',
      q = 'quit',
      x = 'select',
    }
  }
}
