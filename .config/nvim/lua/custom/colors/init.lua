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
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = 1

      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
        pattern = 'gruvbox-material',
        callback = function()
          local config = vim.fn['gruvbox_material#get_configuration']()
          local palette = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground, config.colors_override)
          local set_hl = vim.fn['gruvbox_material#highlight']

          set_hl('TelescopeBorder', palette.fg0, palette.bg_dim)
          set_hl('TelescopeNormal', palette.fg0, palette.bg_dim)
          set_hl('TelescopeSelection', palette.orange, palette.bg1)
          set_hl('TelescopeSelectionCaret', palette.green, palette.bg1)
          set_hl('TelescopeMultiSelection', palette.fg0, palette.bg1)
          set_hl('TelescopeTitle', palette.bg0, palette.red)
          set_hl('TelescopePromptTitle', palette.bg0, palette.purple)
          set_hl('TelescopePreviewTitle', palette.bg0, palette.aqua)
          set_hl('TelescopePromptNormal', palette.fg0, palette.bg_dim)
          set_hl('TelescopePromptBorder', palette.fg0, palette.bg_dim)

          set_hl('FloatBorder', palette.bg0, palette.bg_dim)
          set_hl('NormalFloat', palette.fg0, palette.bg_dim)
        end,
      })
    end,
    init = function()
      vim.cmd.colorscheme 'tokyonight'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
