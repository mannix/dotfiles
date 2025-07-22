local m = vim.keymap

m.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

m.set('n', '<C-h>', '<C-w><C-h>')
m.set('n', '<C-l>', '<C-w><C-l>')
m.set('n', '<C-j>', '<C-w><C-j>')
m.set('n', '<C-k>', '<C-w><C-k>')

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

m.set('n', 'x', '"_x') -- don't copy when deleting a single char

m.set('n', '<leader>v', '<C-w>v', { desc = 'Vertical split' })
m.set('n', '<leader>h', '<C-w>s', { desc = 'Horizontal split' })
m.set('n', '<leader>se', '<C-w>=', { desc = 'Balance splits' })
m.set('n', '<leader>sc', ':close<CR>', { desc = 'Close split' })

m.set('n', '<Tab>', ':bnext!<CR>')
m.set('n', '<S-Tab>', ':bprevious!<CR>')
m.set('n', '<leader>x', '<cmd>bd<CR>', { desc = 'Close buffer safely' })
m.set('n', '<leader>b', '<cmd>enew<CR>', { desc = 'Create empty buffer' })

m.set('n', '<leader>to', ':tabnew<CR>', { desc = 'Open new tab' })
m.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })
m.set('n', '<leader>tn', ':tabn<CR>', { desc = 'Next tab' })
m.set('n', '<leader>tp', ':tabp<CR>', { desc = 'Previous tab' })

m.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrap' })

-- Diagnostic keymaps.
m.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
m.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
m.set('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error messages' })
m.set('n', '<Leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic quickfix list' })
