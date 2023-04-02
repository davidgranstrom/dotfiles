local dap = require 'dap'

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/Cellar/llvm/15.0.2/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.c = {
  {
    name = 'Attach',
    type = 'lldb',
    request = 'attach',
    pid = require('dap.utils').pick_process,
  }
}

dap.configurations.cpp = dap.configurations.c

local active = false
local toggle_session = function()
  local ui = require('dapui')
  if not active then
    print('dap start')
    active = true
    vim.keymap.set('n', ']o', dap.step_over)
    vim.keymap.set('n', ']c', dap.continue)
    vim.keymap.set('n', ']i', dap.step_into)
    vim.keymap.set('n', '[i', dap.step_out)
    dap.continue()
    ui.toggle()
  else
    print('dap exit')
    active = false
    dap.clear_breakpoints()
    ui.toggle()
    dap.terminate()
    vim.keymap.del('n', ']o')
    vim.keymap.del('n', ']c')
    vim.keymap.del('n', ']i')
    vim.keymap.del('n', '[i')
  end
end

vim.keymap.set('n', '<F12>', toggle_session)
vim.keymap.set('n', '<F10>', dap.toggle_breakpoint)
