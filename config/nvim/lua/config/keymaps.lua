local k = vim.keymap

k.set('n', '<leader>w', '<cmd>w<CR>')

k.set('n', '<leader>so', '<cmd>so %<CR>')

k.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

k.set('n', '<leader>x', '<cmd>bdelete<CR>')

k.set('n', '<leader>Q', '<cmd>qa<CR>')

k.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
k.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
k.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
k.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

