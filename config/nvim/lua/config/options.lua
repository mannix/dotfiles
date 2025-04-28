-- Helpers
local vg = vim.g
local vo = vim.opt

-- Leader
vg.mapleader = ' '
vg.maplocalleader = '\\'

-- Setting after `UiEnter` for performance reasons, allegedly
vim.schedule(function()
  vo.clipboard = 'unnamedplus'
end)

-- Visual
vo.number = true
vo.relativenumber = true
vo.breakindent = true
vo.wrap = false
vo.linebreak = true
vo.signcolumn = 'yes'
vo.list = true
vo.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vo.cursorline = true
vo.shiftwidth = 4
vo.tabstop = 4
vo.softtabstop = 4
vo.autoindent = true
vo.expandtab = true
vo.termguicolors = true
vo.showmode = false
--vo.showtabline = 2

-- Search
vo.ignorecase = true
vo.smartcase = true
vo.inccommand = 'split'

-- General Config
vo.mouse = 'a'
vo.undofile = true
vo.updatetime = 250
vo.timeoutlen = 300
vo.splitright = true
vo.splitbelow = true
vo.confirm = true
vo.backspace = 'indent,eol,start'
vo.fileencoding = 'utf-8'
vo.iskeyword:append '-'
vo.runtimepath:remove '/usr/share/vim/vimfiles'
