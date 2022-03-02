local ok, ls = pcall(require, 'luasnip')
if not ok then
  return
end

local vs = ls.parser.parse_snippet
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local rep = require'luasnip.extras'.rep
local fmt = require'luasnip.extras.fmt'.fmt

ls.snippets = {
  all = {
  },
  c = {
    s('pri', fmt('printf("{} = {}\\n", {});', {rep(1), i(0), i(1)}))
  },
  supercollider = {
    s('sb', { t('s.boot;') }),
  },
}
