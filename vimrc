" ========= Setup ========
set nocompatible

set shell=/bin/bash

filetype plugin off
filetype plugin indent off


call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'bkad/CamelCaseMotion'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'adelarsq/vim-matchit'
Plug 'vim-scripts/tcomment'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'uarun/vim-protobuf'
Plug 'vim-ruby/vim-ruby'
Plug 'janko/vim-test'
Plug 'jgdavey/vim-turbux'
Plug 'tpope/vim-dispatch'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'elixir-lang/vim-elixir'
Plug 'justincampbell/vim-railscasts'
Plug 'vim-scripts/gitignore'
Plug 'elzr/vim-json'
Plug 'slim-template/vim-slim'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

set guicursor=
let g:ale_elixir_elixir_ls_release = '/Users/hurley/workspace/elixir-ls/release'
let g:ale_linters_explicit = 1
let test#ruby#use_spring_binstub = 1
set equalalways

" vim-rspec mappings

:tnoremap jj <C-\><C-n>
map <Leader>rb :wa<CR> :TestFile<CR>
map <Leader>rf :wa<CR> :TestNearest<CR>
map <Leader>rl :wa<CR> :TestLast<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction)
nmap \gf :ALEFix<CR>

let g:ale_linters = {
\   'elixir': ['elixir-ls'],
\   'ruby': ['rubocop'],
\   'javascriptreact': ['standard'],
\}
let g:ale_fixers = {
\   'elixir': ['elixir-ls'],
\   'ruby': ['rubocop'],
\   'javascriptreact': ['standard'],
\}

filetype plugin indent on
filetype plugin on

" ========= Options ========

compiler ruby
syntax on
set hlsearch
set number
set showmatch
set incsearch
set hidden
set updatetime=300
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set wrap
set dir=/tmp//
set scrolloff=5
set ignorecase
set smartcase
set wildignore+=*.pyc,*.o,*.class,*.lo,.git,vendor/*,node_modules/**

let g:vim_markdown_new_list_item_indent = 0

if version >= 703
  set undodir=~/.vim/undodir
  set undofile
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif
set undolevels=1000 "maximum number of changes that can be undone

" Color
colorscheme railscasts

" au FileType diff colorscheme desert
" au FileType git colorscheme desert

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" File Types

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.slim set ft=slim

autocmd FileType ruby runtime ruby_mappings.vim

if version >= 700
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
    autocmd FileType tex setlocal spell spelllang=en_us
endif

" Highlight trailing whitespace
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Autoremove trailing spaces when saving the buffer
autocmd FileType coffee,ruby,c,cpp,java,php,html autocmd BufWritePre <buffer> :%s/\s\+$//e

" Highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

" Set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Status
set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

" ========= Plugin Options ========

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

let vimclojure#WantNailgun = 0
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:no_html_toolbar = 'yes'

let coffee_no_trailing_space_error = 1

let NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.lo']
let NERDTreeHijackNetrw = 0

let g:netrw_banner = 0

" ========= Shortcuts ========

" NERDTree
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

" CommandT
map <silent> <leader>ff :Files<CR>
map <silent> <leader>fb :Buffers<CR>

" TComment
map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <LocalLeader>uc :TComment<CR>

map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f --extra=+q --langmap=Lisp:+.clj<CR>
autocmd BufNewFile,BufRead *.rb map <silent> <LocalLeader>rt :!ripper-tags -R --exclude=vendor<CR>


" nnoremap <silent> k gk
" nnoremap <silent> j gj
" nnoremap <silent> Y y$

map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" ========= Insert Shortcuts ========

autocmd BufNewFile,BufRead * imap <C-L> <SPACE>=><SPACE>

imap jj <Esc>

" ========= Functions ========

function! GitGrepWord()
  cgetexpr system("git grep -n '" . expand("<cword>") . "'")
  cwin
  echo 'Number of matches: ' . len(getqflist())
endfunction
command! -nargs=0 GitGrepWord :call GitGrepWord()
nnoremap <silent> <Leader>gw :GitGrepWord<CR>

function! Trim()
  %s/\s*$//
endfunction
command! -nargs=0 Trim :call Trim()
nnoremap <silent> <Leader>cw :Trim<CR>

command! W  write

set tags^=./.git/tags;

set hidden
