" Steps for testing coc-ember works in isolatio.
" 1. Have an ember project.
" 2. Launch: nvim -u path/to/this/file
" 3. Test that language server features are present
"    in the ember project

" All Plugins are declared in here.
" The argument to begin is where they are stored on disk
call plug#begin('~/.local/share/nvim/plugged')
  " Syntax / Theme
  Plug 'joshdick/onedark.vim'
  Plug 'dracula/vim'

  " Highlighting and language support
  Plug 'leafgarland/typescript-vim'
  Plug 'joukevandermaas/vim-ember-hbs'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'adalessa/laravel.nvim'

  " CoC / Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nullvoxpopuli/coc-ember', {'do': 'yarn install --frozen-lockfile'}
  Plug 'preservim/nerdcommenter'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  Plug 'jiangmiao/auto-pairs'

  " Finding
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'MunifTanjim/nui.nvim'
  Plug '3rd/image.nvim'
  
  " Linting
  Plug 'w0rp/ale'
  let g:ale_enabled = 0
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'typescript': ['eslint'],
  \   'typescript.tsx': ['eslint'],
  \}

  let g:ale_fixers = {
  \   'javascript': ['eslint'],
  \   'typescript': ['eslint'],
  \   'typescript.tsx': ['eslint'],
  \}
  let g:ale_sign_column_always = 1

  " Status
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 1

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

  " Snippets
  Plug 'honza/vim-snippets'

  " AI
  Plug 'github/copilot.vim'

  " Git
  Plug 'tpope/vim-fugitive'

  " Elixir
  Plug 'elixir-editors/vim-elixir'

call plug#end()

""""""""""""""""""""""
" CoC configuration
""""""""""""""""""""""

" Someday coc-ember will be in this list
"  - auto updates
"  - in Plug, updates are all manual
let g:coc_global_extensions = [
  \ 'coc-actions',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-snippets',
\ ]

"  \ 'coc-ember',
"  \ 'coc-tsserver',



" True Colors (tm)
set termguicolors

"""""""""""""""""""""""""
" UI / Aesthetics
"""""""""""""""""""""""""
" set background=dark
colorscheme dracula
" let g:airline_theme='onedark'

"""""""""""""""""""""""""
" Editor
"""""""""""""""""""""""""
syntax on
set encoding=utf-8
set guifont=Inconsolata\ for\ Powerline:8

set cmdheight=1      " under statusline messages

set mouse=a          " use mouse for everything
set showmode         " show the current mode (Insert, Visual...)
set laststatus=2     " Always display status line

set cursorline       " highlight current line
" set cursorcolumn     " highlight the current columnm

set ruler            " show current position

set number           " line numbers
set relativenumber   " relative line numbers

set backspace=indent,eol,start  " backspace everywhere

set autoindent   " Use current indentation level for new lines
" set smartindent  " Try to guess indentation based on previous line

" Default indentation - editorconfig should override these
set tabstop=2
set shiftwidth=2
set expandtab

" turn off smart indentation when pasting
" set pastetoggle=<F2>

set hlsearch  " highlight search terms
set list      " show whitespace

" set whitespace chars
" set listchars=eol:¬,tab:>·,extends:>,precedes:<,space:·

set autoread   " Autoload reload files when they have changed on the disk

" Scrolling
set scrolloff=3  " minimum lines to keep above and below cursor

" Backup and Temp
set backupdir=~/.local/share/nvim/_backup/    " where to put backup files.
set directory=~/.local/share/nvim/_temp/      " where to put swap files.

" allow undo history to persist after closing buffer
if has('persistent_undo')
  set undodir=~/.local/share/nvim/_undo
  set undofile
end

""""""""""""""
" Spell Checker
""""""""""""""
set spellfile=~/.local/share/nvim/spell/en_us.utf-8.add


""""""""""""""""""""
" Panes / Buffers
""""""""""""""""""""
set splitright
set equalalways noequalalways " prevents splits from all auto-adjusting horizontally when one closes


""""""""""""""""""""
" Code Management
""""""""""""""""""""
set foldmethod=indent "" fold based on indentation
set foldlevel=99
set nofoldenable      "" don't open a file with folds, display the whole thing
set signcolumn=yes    "" always show the signcolumn

"" set the title of the window to the filename
set title
set titlestring=%f%(\ [%M]%)



" Allow for named template literals to be highlighted
" in a different syntax than the main buffer.
" https://github.com/Quramy/vim-js-pretty-template
function EnableTemplateLiteralColors()
  " list of named template literal tags and their syntax here
  call jspretmpl#register_tag('hbs', 'handlebars')

  autocmd FileType javascript JsPreTmpl
  autocmd FileType typescript JsPreTmpl

  " compat with leafgarland/typescript-vim
  autocmd FileType typescript syn clear foldBraces
endfunction

" call EnableTemplateLiteralColors()




" everything from here below is optional and is just suggestion.

" Personal hotkey preferences to make testing easier.
let mapleader = "\ "
let maplocalleader = "\ "

"" Hot Keys
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
inoremap <silent><expr> <c-space> coc#refresh()
" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

"" Remap for code action
nmap <leader>ga <Plug>(coc-codeaction)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

"" My own shortcuts
nmap <silent> <leader>a :ALEToggle<cr>
nmap <silent> <leader>p :GFiles<cr>
nmap <silent> <leader>b :Buffers<cr>
nmap <silent> <leader>fo :Neotree reveal<cr>
nmap <silent> <leader>t :Neotree toggle<cr>
nmap <silent> <leader>fb :!npx prettier --parser=glimmer --write %<cr>

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

let g:copilot_node_command = "~/.asdf/installs/nodejs/20.11.1/bin/node"
let g:coc_node_path = "~/.asdf/installs/nodejs/20.11.1/bin/node"
