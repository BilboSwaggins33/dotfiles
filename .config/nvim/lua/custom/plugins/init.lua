-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = { -- set to setup table
    },
  },
  {
    'nvimdev/indentmini.nvim',
    config = function()
      require('indentmini').setup()
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    dependencies = { 'lewis6991/gitsigns.nvim' },
    config = function()
      require('scrollbar').setup {}
    end,
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy', -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup {
        signs = {
          left = '',
          right = '',
          diag = '●',
          arrow = '    ',
          up_arrow = '    ',
          vertical = ' │',
          vertical_end = ' └',
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
      harpoon:setup {}

      local function toggle_telescope(harpoon_files)
        local finder = function()
          local paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(paths, item.value)
          end

          return require('telescope.finders').new_table {
            results = paths,
          }
        end

        local function move_mark_down(prompt_bufnr)
          local action_state = require 'telescope.actions.state'
          local selection = action_state.get_selected_entry()
          if not selection then
            return
          end
          if selection.index == 1 then
            return
          end

          local mark = harpoon_files.items[selection.index]

          table.remove(harpoon_files.items, selection.index)
          table.insert(harpoon_files.items, selection.index - 1, mark)

          local current_picker = action_state.get_current_picker(prompt_bufnr)
          current_picker:refresh(finder(), {})

          -- TODO: current_picker:set_selection w/o vim.defer_fn
        end

        local function move_mark_up(prompt_bufnr)
          local action_state = require 'telescope.actions.state'
          local selection = action_state.get_selected_entry()
          if not selection then
            return
          end

          local length = harpoon:list():length()
          if selection.index == length then
            return
          end

          local mark = harpoon_files.items[selection.index]

          table.remove(harpoon_files.items, selection.index)
          table.insert(harpoon_files.items, selection.index + 1, mark)

          local current_picker = action_state.get_current_picker(prompt_bufnr)
          current_picker:refresh(finder(), {})

          -- TODO: current_picker:set_selection w/o vim.defer_fn
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = finder(),
            previewer = false,
            sorter = require('telescope.config').values.generic_sorter {},
            layout_config = {
              height = 0.4,
              width = 0.5,
              prompt_position = 'top',
              preview_cutoff = 120,
            },
            attach_mappings = function(prompt_bufnr, map)
              map('i', '<C-d>', function()
                local state = require 'telescope.actions.state'
                local selected_entry = state.get_selected_entry()
                local current_picker = state.get_current_picker(prompt_bufnr)

                table.remove(harpoon_files.items, selected_entry.index)
                current_picker:refresh(finder())
              end)

              map({ 'n', 'i' }, '<C-j>', function(_prompt_bufnr)
                move_mark_down(_prompt_bufnr)
              end)
              map({ 'n', 'i' }, '<C-k>', function(_prompt_bufnr)
                move_mark_up(_prompt_bufnr)
              end)

              return true
            end,
          })
          :find()
      end
      -- basic telescope configuration
      vim.keymap.set('n', '<C-e>', function()
        toggle_telescope(harpoon:list())
      end)
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end)
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end)
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end)
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end)
      vim.keymap.set('n', '<leader>5', function()
        harpoon:list():select(5)
      end)
      vim.keymap.set('n', '<leader>6', function()
        harpoon:list():select(6)
      end)
      vim.keymap.set('n', '<leader>7', function()
        harpoon:list():select(7)
      end)
    end,
  },
  { 'mhinz/vim-startify' },
  { 'tpope/vim-fugitive' },
  {
    'eandrju/cellular-automaton.nvim',
  },
}
