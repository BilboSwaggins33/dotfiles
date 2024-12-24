return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup {
        options = {
          styles = {
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
          },
        },
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
  { 'diegoulloao/neofusion.nvim', priority = 1000 },
  { 'mellow-theme/mellow.nvim', priority = 1000 },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_foreground = 'mix'
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
        end,
      })
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('kanagawa').setup {
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            -- NormalFloat = { bg = 'none' },
            -- FloatBorder = { bg = 'none' },
            -- FloatTitle = { bg = 'none' },

            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          }
        end,
      }
    end,
    init = function()
      -- Load the colorscheme here. Options:
      -- 'tokyonight-night', 'tokyonight-storm', 'tokyonight-moon', 'tokyonight-day'.
      -- 'catppuccin-mocha', 'catppuccin-macchiato', 'catppuccin-frappe'.
      -- 'nightfox', 'duskfox', 'nordfox'.
      -- 'rose-pine', variant = 'moon, main' - setup'.
      -- 'kanagawa-wave', 'kanagawa-dragon'.
      -- 'neofusion', 'mellow'
      -- 'gruvbox-material'
      vim.cmd.colorscheme 'gruvbox-material'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
