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

m.set('n', '<leader>v', '<C-w>v') -- vertical split
m.set('n', '<leader>h', '<C-w>s') -- horizontal split
m.set('n', '<leader>se', '<C-w>=') -- balance splits
m.set('n', '<leader>sc', ':close<CR>') -- close split

m.set('n', '<Tab>', ':bnext<CR>')
m.set('n', '<S-Tab>', ':bprevious<CR>')
m.set('n', '<leader>x', '<cmd>bd<CR>') -- close buffer safely
m.set('n', '<leader>b', '<cmd>enew<CR>') -- create empty buffer

m.set('n', '<leader>to', ':tabnew<CR>') -- open new tab
m.set('n', '<leader>tx', ':tabclose<CR>') -- close tab
m.set('n', '<leader>tn', ':tabn<CR>') -- next tab
m.set('n', '<leader>tp', ':tabp<CR>') -- prev tab

m.set('n', '<leader>lw', '<cmd>set wrap!<CR>') -- toggle line wrap

