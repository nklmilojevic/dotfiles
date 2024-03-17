return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'ahmedkhalf/project.nvim',
      lazy = false,
      after = 'telescope.nvim',
      config = function()
        require('project_nvim').setup({
          manual_mode = false,
          detection_methods = { 'lsp', 'pattern' },
          patterns = { '.git', 'Makefile', 'package.json' },
          ignore_lsp = {},
          exclude_dirs = {},
          show_hidden = true,
          silent_chdir = true,
          scope_chdir = 'global',
          datapath = vim.fn.stdpath('data'),
        })
        require('telescope').load_extension('projects')
      end,
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
  },
  config = function()
    require('telescope').setup({
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    })

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'project')

    -- See `:help telescope.builtin`
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, {
      desc = '[S]earch [H]elp',
    })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, {
      desc = '[S]earch [K]eymaps',
    })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {
      desc = '[F]ind [F]iles',
    })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, {
      desc = '[S]earch [S]elect Telescope',
    })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, {
      desc = '[F]earch current [W]ord',
    })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, {
      desc = '[S]earch by [G]rep',
    })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {
      desc = '[S]earch [D]iagnostics',
    })
    vim.keymap.set('n', '<leader>sr', builtin.resume, {
      desc = '[S]earch [R]esume',
    })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, {
      desc = '[S]earch Recent Files ("." for repeat)',
    })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, {
      desc = '[ ] Find existing buffers',
    })
    vim.keymap.set('n', '<leader>sP', '<cmd>Telescope projects<cr>', {
      desc = '[S]earch [P]rojects',
    })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, {
      desc = '[/] Fuzzily search in current buffer',
    })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      })
    end, {
      desc = '[S]earch [/] in Open Files',
    })

    -- Shortcut for searching neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files({
        cwd = vim.fn.stdpath('config'),
      })
    end, {
      desc = '[S]earch [N]eovim files',
    })
  end,
}
