return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.completion.copilot-lua" },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = {
        yaml = true,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      suggestion = {
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "<C/>",
        },
      },
    },
  },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.project.nvim-spectre" },
}
