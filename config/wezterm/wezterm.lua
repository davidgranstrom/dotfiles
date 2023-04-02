local wezterm = require'wezterm'
local colorscheme = require'colorschemes.tokyonight'
local action = wezterm.action

local function conditional_activate_pane(window, pane, pane_direction, vim_direction)
  local is_vim_proc = pane:get_foreground_process_name():find('n?vim') ~= nil
  if is_vim_proc then
    window:perform_action(
      action.SendKey({ key = vim_direction, mods = 'ALT' }),
      pane
    )
  else
    window:perform_action(action.ActivatePaneDirection(pane_direction), pane)
  end
end

wezterm.on('ActivatePaneDirection-right', function(window, pane)
    conditional_activate_pane(window, pane, 'Right', 'l')
end)

wezterm.on('ActivatePaneDirection-left', function(window, pane)
    conditional_activate_pane(window, pane, 'Left', 'h')
end)

wezterm.on('ActivatePaneDirection-up', function(window, pane)
    conditional_activate_pane(window, pane, 'Up', 'k')
end)

wezterm.on('ActivatePaneDirection-down', function(window, pane)
    conditional_activate_pane(window, pane, 'Down', 'j')
end)

return {
  -- font
  font = wezterm.font({
    family = 'JetBrainsMono Nerd Font',
    -- family = 'JuliaMono',
    -- family = 'ProggyVector',
    harfbuzz_features = {"calt=0", "clig=0", "liga=0"},
  }),
  font_size = 16.0,
  line_height = 1.2,
  freetype_load_target = "Light",
  freetype_render_target = "HorizontalLcd",

  -- keys
  leader = { key = 'f', mods = 'CTRL' },
  keys = {
    { key = 'c', mods = 'LEADER', action = action.SpawnTab 'DefaultDomain', },
    { key = '"', mods = 'LEADER', action = action.SplitVertical { domain = 'CurrentPaneDomain' }, },
    { key = '%', mods = 'LEADER', action = action.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
    { key = 'h', mods = 'ALT', action = action.EmitEvent('ActivatePaneDirection-left') },
    { key = 'j', mods = 'ALT', action = action.EmitEvent('ActivatePaneDirection-down') },
    { key = 'k', mods = 'ALT', action = action.EmitEvent('ActivatePaneDirection-up') },
    { key = 'l', mods = 'ALT', action = action.EmitEvent('ActivatePaneDirection-right') },
    { key = 'Enter', mods = 'CMD', action = 'ToggleFullScreen', },
    { key = 'LeftArrow', mods = 'CMD', action = action.AdjustPaneSize { 'Left', 5 }, },
    { key = 'DownArrow', mods = 'CMD', action = action.AdjustPaneSize { 'Down', 5 }, },
    { key = 'RightArrow', mods = 'CMD', action = action.AdjustPaneSize { 'Right', 5 }, },
    { key = 'UpArrow', mods = 'CMD', action = action.AdjustPaneSize { 'Up', 5 }, },
  },
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,

  -- appearance
  use_fancy_tab_bar = false, -- this needs to be set before colorscheme
  colors = colorscheme,
  force_reverse_video_cursor = false,
  enable_tab_bar = true,
  -- window_background_opacity = 0.8,
  -- macos_window_background_blur = 60,
  window_padding = {
    left = "0.5cell",
    right = "0.5cell",
    top = "0cell",
    bottom = "0cell",
  }
}
