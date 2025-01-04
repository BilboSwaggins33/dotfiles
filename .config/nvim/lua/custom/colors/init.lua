return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
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
          TelescopeBorder = { fg = 'palette.bg0', bg = 'palette.bg0' },
          TelescopeNormal = { fg = 'palette.fg0', bg = 'palette.bg0' },
          TelescopeSelection = { fg = 'palette.orange', bg = 'palette.bg1' },
          TelescopeSelectionCaret = { fg = 'palette.green', bg = 'palette.bg1' },
          TelescopeMultiSelection = { fg = 'palette.fg1', bg = 'palette.bg1' },
          TelsescopeTitle = { fg = 'palette.bg0', bg = 'palette.red' },
          TelescopePromptTitle = { fg = 'palette.bg0', bg = 'palette.magenta' },
          TelescopePreviewTitle = { fg = 'palette.bg0', bg = 'palette.yellow' },
          TelescopePromptNormal = { fg = 'palette.fg1', bg = 'palette.bg0' },
          TelescopePromptBorder = { fg = 'palette.bg0', bg = 'palette.bg0' },
          FloatBorder = { fg = 'palette.bg0', bg = 'palette.bg0' },
          NormalFloat = { fg = 'palette.fg1', bg = 'palette.bg0' },
        },
      }
      require('nightfox').setup {
        options = options,
        groups = groups,
      }

      vim.cmd.highlight 'IndentLine guifg=#29394f'
      vim.cmd.highlight 'IndentLineCurrent guifg=#71839b'
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = 1

      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
        pattern = 'gruvbox-material',
        callback = function()
          local config = vim.fn['gruvbox_material#get_configuration']()
          local palette = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground, config.colors_override)
          local set_hl = vim.fn['gruvbox_material#highlight']

          set_hl('TelescopeBorder', palette.bg_dim, palette.bg_dim)
          set_hl('TelescopeNormal', palette.fg0, palette.bg_dim)
          set_hl('TelescopeSelection', palette.blue, palette.bg1)
          set_hl('TelescopeSelectionCaret', palette.green, palette.bg_dim)
          set_hl('TelescopeMultiSelection', palette.fg1, palette.bg1)

          set_hl('TelescopeTitle', palette.bg_dim, palette.red)
          set_hl('TelescopePromptTitle', palette.bg_dim, palette.purple)
          set_hl('TelescopePreviewTitle', palette.bg_dim, palette.yellow)
          local promptBg = palette.bg1
          set_hl('TelescopePromptNormal', palette.fg1, promptBg)
          set_hl('TelescopePromptBorder', promptBg, promptBg)

          set_hl('FloatBorder', palette.bg_dim, palette.bg_dim)
          set_hl('NormalFloat', palette.fg0, palette.bg_dim)

          vim.cmd.highlight 'IndentLine guifg=#3c3836'
          vim.cmd.highlight 'IndentLineCurrent guifg=#89b482'
        end,
      })
    end,
    init = function()
      -- Load the colorscheme here. Options:
      -- 'tokyonight-night', 'tokyonight-storm', 'tokyonight-moon', 'tokyonight-day'.
      -- 'catppuccin-mocha', 'catppuccin-macchiato', 'catppuccin-frappe'.
      -- 'nightfox', 'duskfox', 'nordfox'.
      -- 'rose-pine', variant = 'moon, main' - setup'.
      -- 'gruvbox-material'
      vim.cmd.colorscheme 'nightfox'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
