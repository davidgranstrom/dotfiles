local wezterm = require'wezterm'
local colorscheme = require'colorschemes.tokyonight'

return {
  -- font
  font = wezterm.font({
    family = 'JetBrainsMono Nerd Font',
    harfbuzz_features = {"calt=0", "clig=0", "liga=0"},
  }),
  font_size = 16.0,

  -- keys
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,
  keys = {
    { key="Enter", mods="CMD", action="ToggleFullScreen" }
  },

  -- appearance
  colors = colorscheme,
  force_reverse_video_cursor = true,
  enable_tab_bar = false,
  window_padding = {
    left = "0.5cell",
    right = "0.5cell",
    top = "0cell",
    bottom = "0cell",
  }
}
