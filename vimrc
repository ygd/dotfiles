set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'
Plugin 'low-ghost/nerdtree-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ervandew/supertab'
Plugin 'danro/rename.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-liquid'
Plugin 'tpope/vim-endwise'
Plugin 'sheerun/vim-polyglot'
Plugin 'alvan/vim-closetag'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'

call vundle#end()
filetype plugin indent on

colorscheme jellybeans

autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraLines ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

autocmd Filetype gitcommit setlocal spell textwidth=72


execute "set colorcolumn=" . join(range(81,335), ',')
set number
set smartcase
set hlsearch
set incsearch
set nobackup
set nowb
set noswapfile
set expandtab
set shiftwidth=2
set tabstop=2
set ai
set si
set undofile
set undodir=/Users/ygd/.vimundo/

augroup vimrc
  autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup end

function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

let g:ctrlp_custom_ignore = { 'dir':  '/_site' }

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:airline_powerline_fonts = 1
let mapleader=" "
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>a :Ack!<space>
nnoremap <leader>n :NERDTree <cr>
nnoremap <leader>rn :Rename<space>
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!

nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>! :q!<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader><leader> <C-^>
nnoremap <leader>s :%s/
nnoremap <leader>. @q

nnoremap <leader>g :Gstatus<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gco :Gread<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gpl :Git pull<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>grn :Gmove<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gg :Ggrep

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>vr :vertical resize
nnoremap @ :vertical resize +5<CR>
nnoremap ª :vertical resize -5<CR>

nnoremap º :m .+1<CR>==
nnoremap ∆ :m .-2<CR>==
inoremap º <Esc>:m .+1<CR>==gi
inoremap ∆ <Esc>:m .-2<CR>==gi
vnoremap º :m '>+1<CR>gv=gv
vnoremap ∆ :m '<-2<CR>gv=gv

vnoremap <leader>y "*y
nnoremap <leader>yy "*yy
nnoremap <leader>p "*p
nnoremap <leader>P "*<S-p>

inoremap <leader><C> <C-x><C-o>
