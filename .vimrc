set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vim-airline/vim-airline'
call vundle#begin()

syntax enable
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set number
set showcmd
set incsearch
set hlsearch
set autoindent
set listchars=eol:$
set list
set t_Co=256
autocmd BufWritePre * :%s/\s\+$//e    " Remove trailing spaces on save

" Plugins
execute pathogen#infect()

colorscheme seattle
filetype plugin indent on

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" NerdTree automatically open when vim start
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" Ctrl-P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" JS Syntax
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" set foldmethod=syntax " JS code folding

" JSX Syntax highlighting and indenting
let g:jsx_ext_required = 0 " allowing JSX highlighting in .js file

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Airline configurations
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
set laststatus=2
" End Airline configurations

" Configuration for ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'
" End configuration for ale
