local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.colors = {
  foreground = '#ffffff',
  background = '#263238',

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  -- cursor_bg = '#52ad70',
  -- Overrides the text color when the current cell is occupied by the cursor
  -- cursor_fg = 'black',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  -- cursor_border = '#52ad70',

  -- the foreground color of selected text
  -- selection_fg = 'black',
  -- the background color of selected text
  -- selection_bg = '#fffacd',

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = '#222222',

  -- The color of the split lines between panes
  split = '#ffffff',

  ansi = {
    '#000000',
    '#FF5370',
    '#C3E88D',
    '#FFCB6B',
    '#82AAFF',
    '#c397d8',
    '#82AAFF',
    'silver',
  },
  brights = {
    '#000000',
    '#FF5370',
    '#C3E88D',
    '#FFCB6B',
    '#82AAFF',
    '#c397d8',
    '#82AAFF',
    'white',
  },
}

config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font "Fira Code"
-- config.font =
--   wezterm.font('Fira Code', { weight = 'Normal', italic = false })
config.window_close_confirmation = "NeverPrompt"

config.font_size = 10.9

config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 0,
}

return config
