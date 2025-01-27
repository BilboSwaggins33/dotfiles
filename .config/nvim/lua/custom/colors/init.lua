return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        on_highlights = function(hl, c)
          local prompt = '#2d3149'
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.SnacksIndentScope = {
            fg = c.fg_dark,
          }
        end,
      }
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      local c = require('gruvbox').palette
      require('gruvbox').setup {
        contrast = '',
        transparent_mode = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        overrides = {
          TelescopeNormal = {
            bg = c.dark0_soft,
            fg = c.light4,
          },
          TelescopeBorder = {
            bg = c.dark0_soft,
            fg = c.dark0_soft,
          },
          TelescopePromptNormal = {
            bg = c.dark1,
          },
          TelescopePromptBorder = {
            bg = c.dark1,
            fg = c.dark1,
          },
          TelescopePromptTitle = {
            bg = c.dark1,
            fg = c.dark1,
          },
          TelescopePreviewTitle = {
            bg = c.dark0_soft,
            fg = c.dark0_soft,
          },
          TelescopeResultsTitle = {
            bg = c.dark0_soft,
            fg = c.dark0_soft,
          },
          SnacksIndentScope = {
            fg = c.light4,
          },
        },
      }
    end,
    init = function()
      vim.cmd.colorscheme 'gruvbox'
      vim.api.nvim_set_hl(0, 'Folded', { italic = true, bg = '#282828' })
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
      }
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'auto',
        styles = {
          transparency = true,
        },
      }
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      local options = {
        styles = {
          comments = 'italic',
          keywords = 'bold',
          types = 'italic,bold',
        },
      }
      local groups = {
        all = {
          TelescopeBorder = { fg = '', bg = 'palette.bg0' },
          TelescopeNormal = { fg = 'palette.fg0', bg = 'palette.bg0' },
          TelescopeSelection = { fg = 'palette.orange', bg = 'palette.bg1' },
          TelescopeSelectionCaret = { fg = 'palette.green', bg = 'palette.bg1' },
          TelescopeMultiSelection = { fg = 'palette.fg0', bg = 'palette.bg1' },
          TelsescopeTitle = { fg = 'palette.bg0', bg = 'palette.red' },
          TelescopePromptTitle = { fg = 'palette.fg0', bg = 'palette.magenta' },
          TelescopePreviewTitle = { fg = 'palette.fg0', bg = 'palette.green' },
          TelescopePromptNormal = { fg = 'palette.fg0', bg = 'palette.bg0' },
          TelescopePromptBorder = { fg = 'palette.bg0', bg = 'palette.bg0' },

          FloatBorder = { fg = 'palette.bg0', bg = 'palette.bg0' },
          NormalFloat = { fg = 'palette.fg0', bg = 'palette.bg0' },
        },
      }
      require('nightfox').setup {
        options = options,
        groups = groups,
      }
    end,
  },
}
