-- Lualine setup
require('lualine').setup{
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
  },
  sections = {lualine_c = {require('auto-session-library').current_session_name}}
}

