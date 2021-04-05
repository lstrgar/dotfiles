
" 1. PREAMBLE
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""" Download vim.plug via curl if it isn't found in default location
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 2. PLUGINS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
call plug#begin('~/.vim/plugged')
" badwolf: great colorscheme
Plug 'sjl/badwolf'

" fzf: awesome fuzzy-file-finder
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'

" vim-commentary: gcc to comment out lines or blocks
Plug 'tpope/vim-commentary'

" lightline: attractive status/tabline
Plug 'itchyny/lightline.vim'

" floaterm: popup terminal
Plug 'voldikss/vim-floaterm'

" jedi: python autocompletion
Plug 'davidhalter/jedi-vim'
let g:jedi#force_py_version = 3 

" vimcompletesme: tab completion like jupyter lab
Plug 'ajh17/VimCompletesMe'

"iamcco/markdown-preview.vim: real-time in-browser rendering of .md files"
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 3. BASICS
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Boilerplate
let mapleader=';'
set colorcolumn=80
set cursorline
set cursorcolumn
set laststatus=2
syntax enable
filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set showcmd
set wildmenu
set incsearch
set hlsearch
set smartcase
set number
set noswapfile

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" Pinky mapleader
let mapleader=';'

" The Toby Alden One-Two
tnoremap jk <C-\><C-n>
inoremap jk <esc>
nmap <space><space> :w<cr>

" Pro-Mode (comment out if you want to use arrow-keys)
nnoremap <left>     <nop>
nnoremap <right>    <nop>
nnoremap <up>       <nop>
nnoremap <down>     <nop>
inoremap <left>     <nop>
inoremap <right>    <nop>
inoremap <up>       <nop>
inoremap <down>     <nop>

" Run current file with python3
map <leader>p  :! python3 % <CR>

" Autoformat a python document
map <leader>b :! black % <CR>  :edit % <CR> :! isort % <CR> :edit % <CR>

" Zoom and Unzoom
map <leader>z <C-W>_ <C-W><Bar>
map <leader>e <C-W>=

" Jump to Splits
map <leader>h <Esc><C-W>h
map <leader>hh <Esc>gT
map <leader>ll <Esc>gt 
map <leader>j <Esc><C-W>j
map <leader>k <Esc><C-W>k
map <leader>l <Esc><C-W>l

" Open new documents in tabs or vsplits
map <leader>v <Esc>:vsplit<CR>
map <leader>t <Esc>:tabnew<CR>
map <leader>f :Files<CR>

map <leader>r qa
map <leader>a @a
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 4. PLUGIN CUSTOMIZATION
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" badwolf
colorscheme badwolf

" lightline
let g:lightline = {'colorscheme': 'PaperColor_dark'}

" vim-rainbow
let rainbow_active=1
let rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" floatterm
let g:floaterm_wintype = 'popup'
let g:floaterm_autoclose=2
nnoremap   <silent>   <leader>e    :FloatermNew<CR>
tnoremap   <silent>   <leader>r   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <leader>r   :FloatermToggle<CR>

"markdown-preview
let g:mkdp_auto_start=1
let g:mkdp_auto_close=0

