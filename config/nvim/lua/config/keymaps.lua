local k = vim.keymap

-- save
k.set('n', '<leader>w', '<cmd>w<CR>')

-- source buffer
k.set('n', '<leader>so', '<cmd>so %<CR>')

-- clear search
k.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- delete buffer
k.set('n', '<leader>x', '<cmd>bdelete<CR>')

-- quit all
k.set('n', '<leader>Q', '<cmd>qa<CR>')

k.set('n', '<C-h>', '<C-w><C-h>')
k.set('n', '<C-l>', '<C-w><C-l>')
k.set('n', '<C-j>', '<C-w><C-j>')
k.set('n', '<C-k>', '<C-w><C-k>')

