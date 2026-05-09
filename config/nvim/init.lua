-- leader must be set before any keymaps or plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('options')
require('keymaps')
require('plugins')
