syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number
set showcmd
set incsearch
set hlsearch
set autoindent
execute pathogen#infect()
syntax on
filetype plugin indent on
let g:netrw_liststyle=3
let mapleader=" "
map <leader>k :E<cr> 

" Removed trailing white space
autocmd BufWritePre *.py :%s/\s\+$//e

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" NerdTree automatically open when vim start
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
