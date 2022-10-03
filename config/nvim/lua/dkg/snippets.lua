local ok, ls = pcall(require, 'luasnip')
if not ok then
  return
end

local vs = ls.parser.parse_snippet
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local p = require("luasnip.extras").partial
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('c', {
  s('pri', fmt('printf("** {} = {}\\n", {});', {rep(1), i(0), i(1)}))
}, {
  key = 'c'
})

ls.add_snippets('supercollider', {
  s('sb', { t('s.boot;') }),
}, {
  key = 'supercollider'
})

ls.add_snippets("all", {
  s('date', p(os.date, '%Y')),
}, {
  key = 'all'
})
