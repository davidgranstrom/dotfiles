local ls = require'luasnip'
local ls_types = require'luasnip.util.types'

ls.setup {
  -- Remember last snippet
  history = false,
  -- Dynamic update
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = false,
  ext_opts = {
    [ls_types.choiceNode] = {
      active = {
        virt_text = { { '←', 'Error'} }
      }
    }
  }
}

local function expand_or_jump()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end

local function jump_back()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end

local map = vim.keymap.set

-- map('i', '<C-j>', '<cmd>lua require"dkg.configs.luasnip".expand_or_jump()<cr>')
-- map('i', '<C-k>', '<cmd>lua require"dkg.configs.luasnip".jump_back()<cr>')
-- map('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/lua/dkg/snippets.lua<cr>', {silent = true})

return {
  expand_or_jump = expand_or_jump,
  jump_back = jumpa_back,
}
