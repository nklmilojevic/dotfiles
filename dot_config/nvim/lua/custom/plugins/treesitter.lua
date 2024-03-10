return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'c',
        'css',
        'dockerfile',
        'elixir',
        'go',
        'gomod',
        'hcl',
        'html',
        'json',
        'lua',
        'markdown',
        'php',
        'python',
        'regex',
        'ruby',
        'rust',
        'sql',
        'terraform',
        'toml',
        'tsx',
        'vim',
        'vimdoc',
        'yaml',
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
