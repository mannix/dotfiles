"      ___                
"     /\__\          ___           
"    /::|  |        /\__\           
"   /:::|  |       /:/  /            
"  /:/|:|__|__    /:/  /        
" /:/ |::::\__\  /:/__/  ___        
" \/__/~~/:/  /  |:|  | /\__\         
"       /:/  /   |:|  |/:/  /        
"      /:/  /    |:|__/:/  /
"     /:/  /      \::::/__/
"     \/__/ ike's   ~~~~   imrc (err... I mean init.vim)


" first things first {{{
" ==============================================================================
let mapleader=' '

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
set encoding=utf-8
set fileencoding=utf-8
set autoread

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" set autoindent nosmartindent shiftround
set softtabstop=2 tabstop=2 shiftwidth=2 expandtab smarttab

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on
set smartindent

" Don't wrap long lines by default
set nowrap 

" splits should open to the right and bottom (default is left and top)
set splitright
set splitbelow

set cursorline
set nocursorcolumn

" set nohlsearch " Don't highlight search results
set hlsearch incsearch
set ignorecase smartcase

" Use <C-L> to clear the highlights of :set hlsearch
" and <leader>l to clear highlighting and also reset syntax highlighting from the beginning of the file
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" always show statusline
set laststatus=2

" minimum number of lines/chars to show surrounding the cursor
set scrolloff=3
set sidescrolloff=5
set sidescroll=1

" width of the line numbers column
set numberwidth=4

" Show relative line number
set relativenumber
" Show actual line number for current line
set nu

" File history managment
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Always show sign column
set signcolumn=yes

" Split edit vimrc
nmap <leader>vr :sp $MYVIMRC<cr>
" Source vimrc
nmap <leader>so :source $MYVIMRC<cr>

" Indent file
nmap <leader>i gg=G''

" Move visual selection down
vnoremap J :m '>+1<cr>gv=gv 
" Move visual selection up
vnoremap K :m '<-2<cr>gv=gvnnoremap <C-H> <C-W><C-H>

" ESC is too far away
imap jk <Esc>
imap kj <Esc>
imap jj <Esc>
imap kk <Esc>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
" rebalance a vim panes
nnoremap <leader>= :wincmd =<cr>

set foldmethod=syntax
set foldcolumn=0
let javaScript_fold=1
set foldlevelstart=99

" use tab to toggle fold
nmap <tab> za


call plug#begin('~/.config/nvim/plugged')
" General
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'rstacruz/vim-closer'
Plug 'itchyny/lightline.vim'
Plug 'norcalli/nvim-colorizer.lua'
" Language
Plug 'StanAngeloff/php.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'rust-lang/rust.vim'
" Theme
Plug 'jonathanfilip/vim-lucius'
Plug 'mannix/lightline-lucius'
call plug#end()


" fzf
" respect gitignore if `ag` is installed
if (executable('ag'))
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif
" Empty value to disable preview window altogether
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'down': '~40%' }
nnoremap <C-P> :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>
nmap <leader>s :Ag<Space>


" nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeWinSize = 60
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Show current buffer in tree
nnoremap <silent> <leader>t :NERDTreeFind<CR>


" fugitive
nnoremap <leader>g :Git<CR>


" lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'lucius',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction


" colors
set background=dark
colorscheme lucius
LuciusDarkHighContrast
"LuciusLightHighContrast


" python
if has('pythonx') || has('python3')
  set pyxversion=3
elseif has('python2')
  set pyxversion=2
endif


" Filetype Overrides
augroup filetypeoverrides
  autocmd!

  " Give JSON files JavaScript highlighting
  au BufRead,BufNewFile *.json set ft=json syntax=javascript

  " Use '//' instead of '/* */' comments
  " autocmd FileType php setlocal commentstring=//%s
augroup end


" vim: set nospell foldmethod=marker foldlevel=99:
