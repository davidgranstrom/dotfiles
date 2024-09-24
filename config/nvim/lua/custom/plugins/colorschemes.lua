return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    },
  },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      borderless_telescope = false,
      hide_fillchars = false,
      italic_comments = true,
      theme =  {
        overrides = function(colors)
          return {
            Identifier = { fg = colors.blue, bg = "NONE", italic = false },
            -- VertSplit = { fg = '#16181a', bg = '#16181a' },
          }
        end,
      }
    }
  }
}
