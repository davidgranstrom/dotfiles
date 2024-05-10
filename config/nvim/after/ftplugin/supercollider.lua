local setlocal = vim.opt_local

-- Indentation
setlocal.tabstop = 4
setlocal.shiftwidth = 4

vim.keymap.set('n', '<leader>d', '<cmd>Telescope scdoc<cr>', { buffer = true })

--- Get the help source URI for "subject"
---@param subject The subject to find
---@param cb A callback which gets the URI as its first argument
local function get_help_uri_(subject, cb)
  local cmd = [[SCDoc.helpSourceDir +/+ \"Classes\" +/+ \"%s\" ++ \".schelp\"]]
  cmd = string.format(cmd, subject)
  require('scnvim').eval(cmd, cb)
end

--- Open the help source file for the word under the cursor
function find_sc_help_source()
  local subject = vim.fn.expand '<cword>'
  get_help_uri_(subject, function(result)
    result = string.format('edit %s', result)
    vim.cmd(result)
  end)
end
