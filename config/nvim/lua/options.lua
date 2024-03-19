vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.signcolumn = 'yes'

vim.opt.cursorline = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- setting to 0 makes nvim use tabstop value

vim.opt.clipboard = "unnamedplus" -- use system clipboard

--vim.opt.scrolloff = 999 -- keeps current line in center

vim.opt.virtualedit = "block" -- VISUAL BLOCK mode can now select trailing white space

vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.hlsearch = true

vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.breakindent = true

-- Save undo history
-- Looking at the help file for this wasn't clear.
-- Maybe learn about general neovim undo some day
-- But since it TJ used it I assume it's good?
-- vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
