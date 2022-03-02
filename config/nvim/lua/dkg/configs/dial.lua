local dial = require'dial.map'
local augend = require'dial.augend'
local map = require'dkg.utils'.map

map('n', '<C-a>', dial.inc_normal())
map('n', '<C-x>', dial.dec_normal())
map('v', '<C-a>', dial.inc_visual())
map('v', '<C-x>', dial.dec_visual())
map('v', 'g<C-a>', dial.inc_gvisual())
map('v', 'g<C-x>', dial.dec_gvisual())

require'dial.config'.augends:register_group{
  -- default augends used when no group name is specified
  default = {
    augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
    augend.integer.alias.decimal,
    augend.constant.alias.bool,    -- boolean value (true <-> false)
    augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
    -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
    augend.hexcolor.new{
      case = "lower",
    },
  }
}
