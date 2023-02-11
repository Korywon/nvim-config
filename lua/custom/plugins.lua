return function(use)
  use {
    'akinsho/toggleterm.nvim',
    config = function ()
      require("toggleterm").setup()
    end
  }

  -- Colorscheme
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- Hints at what commands are available
  use({
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end
  })

  use({
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
      require('lspsaga').setup()
    end,
    requires = { {'nvim-tree/nvim-web-devicons'} }
  })

  -- Fancy start up window
  use 'mhinz/vim-startify'

  -- Hghlights whitespace
  use 'ntpeters/vim-better-whitespace'

  -- Manage files via telescope
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- File tree (similar to explorer in vs code)
  use {
    'nvim-tree/nvim-tree.lua',
    config = function ()
      require('nvim-tree').setup()
    end,
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Shows icons in telescope
  use 'nvim-tree/nvim-web-devicons'

  -- Fancy notifications
  use 'rcarriga/nvim-notify'

  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/projects", "~/Downloads", "/"},
      }
    end
  }

  -- Allows use of tabs
  use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}
end

