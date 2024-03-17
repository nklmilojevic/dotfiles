local km = vim.keymap

km.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
km.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = 'Go to previous [D]iagnostic message',
})
km.set('n', ']d', vim.diagnostic.goto_next, {
  desc = 'Go to next [D]iagnostic message',
})
km.set('n', '<leader>e', vim.diagnostic.open_float, {
  desc = 'Show diagnostic [E]rror messages',
})
km.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostic [Q]uickfix list',
})

km.set('t', '<Esc><Esc>', '<C-\\><C-n>', {
  desc = 'Exit terminal mode',
})

km.set('n', '<C-h>', '<C-w><C-h>', {
  desc = 'Move focus to the left window',
})
km.set('n', '<C-l>', '<C-w><C-l>', {
  desc = 'Move focus to the right window',
})
km.set('n', '<C-j>', '<C-w><C-j>', {
  desc = 'Move focus to the lower window',
})
km.set('n', '<C-k>', '<C-w><C-k>', {
  desc = 'Move focus to the upper window',
})

km.set('n', '<leader>lg', '<cmd>LazyGit<cr>', {
  desc = 'LazyGit',
})
km.set('n', '<leader>t', '<cmd>ToggleTerm<cr>', {
  desc = 'ToggleTerm',
})
