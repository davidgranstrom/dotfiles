local dap = require 'dap'

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/Cellar/llvm/13.0.1_1/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.c = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.cpp = dap.configurations.c

local active = false
local toggle_session = function()
  if not active then
    print('dap start')
    active = true
    vim.keymap.set('n', '<cr>', dap.step_over)
    vim.keymap.set('n', '<leader>i', dap.step_into)
    dap.continue()
  else
    print('dap exit')
    active = false
    vim.keymap.del('n', '<cr>')
    vim.keymap.del('n', '<leader>i')
  end
end

vim.keymap.set('n', '<F10>', toggle_session)
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint)
