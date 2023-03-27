local wezterm = require 'wezterm'

return {
  font = wezterm.font 'JetBrains Mono',
  color_scheme = 'Gruvbox dark, medium (base16)',
  scrollback_lines = 9999999,

  leader = { key = 'w', mods = 'CTRL', timeout_milliseconds = 1000 },
  hyperlink_rules = {
    {
      regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },
    -- http://localhost:3000/index.html
    {
      regex = "\\b\\w+://(?:[\\w.-]+):\\d+\\S*\\b",
      format = "$0",
    },
    -- file:// URI
    {
      regex = "\\bfile://\\S*\\b",
      format = "$0",
    },
    -- for cookpad
    {
      regex = "Android/android-cookpad#(\\d+)",
      format = "https://ghe.ckpd.co/Android/android-cookpad/issues/$1",
    },
    {
      regex = "(\\w+)/(\\w+)#(\\d+)",
      format = "https://ghe.ckpd.co/$1/$2/issues/$3",
    },
  },
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
    {
      key = '[',
      mods = 'LEADER',
      action = wezterm.action.ActivateCopyMode,
    }
  },
}
