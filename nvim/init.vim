set shell=bash 
" Basic editing configuration
set nocompatible
set hidden
set number

set showtabline=2
set autoread
set updatetime=300
set nowrap

" Own shortcuts
nmap <silent> <leader>bd :bd<cr>

source ~/.dotfiles/nvim/ember.vim
