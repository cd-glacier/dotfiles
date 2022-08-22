local wezterm = require 'wezterm'

return {
  font = wezterm.font 'JetBrains Mono',
  color_scheme = 'Gruvbox Dark',

  leader = { key = 'w', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    {
      key = '|',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '-',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'h',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
      key = 'j',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
      key = 'k',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
      key = 'l',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Right',
    },
  },
}
