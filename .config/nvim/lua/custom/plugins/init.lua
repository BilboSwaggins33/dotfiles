-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'petertriho/nvim-scrollbar',
    dependencies = { 'lewis6991/gitsigns.nvim' },
    config = function()
      require('scrollbar').setup {}
    end,
  },
  {
    'letieu/harpoon-lualine',
    dependencies = {
      {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
      },
    },
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy', -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup {
        blend = {
          factor = 0.27,
        },
        options = {
          show_source = true,
          multilines = true,
          show_all_diags_on_cursorline = false,
        },
      }
      vim.diagnostic.config { virtual_text = false }
    end,
  },
  {
    'nvzone/timerly',
    dependencies = { 'nvzone/volt' },
    config = function()
      vim.keymap.set('n', '<leader>tt', '<cmd>TimerlyToggle<CR>')
    end,
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.cmd [[filetype plugin indent on]]
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- required by telescope
      'MunifTanjim/nui.nvim',
    },
    opts = {
      -- configuration goes here
    },
  },
  --  {
  --    'NStefan002/donut.nvim',
  --    version = '*',
  --    lazy = false,
  --  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      require('oil').setup {
        columns = {
          'icon',
          'size',
        },
        delete_to_trash = true,
        view_options = {
          show_hidden = true,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, '.')
          end,
        },
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local function get_timerly_status()
        local state = require 'timerly.state'
        if state.progress == 0 then
          return ''
        end

        local total = math.max(0, state.total_secs + 1) -- Add 1 to sync with timer display
        local mins = math.floor(total / 60)
        local secs = total % 60

        return string.format('%s %02d:%02d', state.mode:gsub('^%l', string.upper), mins, secs)
      end

      require('lualine').setup {

        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = ' ', right = ' ' },
          section_separators = { left = ' ', right = ' ' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            'filename',
          },
          lualine_x = {
            get_timerly_status,
            {
              'harpoon2',
              indicators = { 'h', 'j', 'k', 'l' },
              active_indicators = { 'h', 'j', 'k', 'l' },
              color_active = { fg = '#a9b665' },
            },
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      }
    end,
  },
  {
    'nvim-orgmode/orgmode',
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/personal/az.org',
        org_default_notes_file = '~/personal/az.org',
        org_agenda_skip_deadline_if_done = true,
        org_agenda_skip_scheduled_if_done = true,
      }
    end,
  },
  { 'mbbill/undotree' },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local harpoon = require 'harpoon'
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      harpoon:setup {
        global_settings = {
          tabline = true,
        },
        menu = {
          borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
        },
      }
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<C-j>', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<C-k>', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<C-l>', function()
        harpoon:list():select(4)
      end)
    end,
  },
  { 'mhinz/vim-startify' },
  { 'tpope/vim-fugitive' },
  {
    'eandrju/cellular-automaton.nvim',
  },
}
