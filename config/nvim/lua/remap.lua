vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<leader>q", "<cmd>qa<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
