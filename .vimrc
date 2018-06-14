set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Solarzied dark
Plugin 'lifepillar/vim-solarized8'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" powerline / airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" auto pairs
Plugin 'jiangmiao/auto-pairs'

" you complete me
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype on


" Solarized dark
syntax enable
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized8
"let g:solarized_termcolors=256
"let g:solarized_use16 = 1


" powerline / airline
set encoding=utf-8
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1


" you complete me
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 0


" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


" display line numbers
set number

" column at 80 chars
set colorcolumn=80

" enable mouse
set mouse=a

" disable bell
set visualbell t_vb=

" change backspace behavoir
set bs=2

" automatic indentation
set autoindent
set cindent


" reload files on external changes
au CursorHold,CursorHoldI * checktime
set updatetime=500
" au FocusGained,BufEnter * :checktime



" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


" search
"" turn on incremental search
set incsearch
"" ignorecase while searching
set ignorecase


" rebind <Leader> key
let mapleader = ","


" quick quit (in normal mode)
nmap <Leader>q :quit<CR>

" quick quit everything
nmap <Leader>x :qa<CR>

" quick save (in normal node)
nmap <Leader>s :w<CR>


" tabs
"" create a new tab
nmap <Leader>t :tabnew<CR>
"" close all tabs
nmap <Leader>E :qa!<CR>
"" switch to left tab
nmap <Leader>n :tabprevious<CR>
"" switch to right tab
nmap <Leader>m :tabnext<CR>


" NERDTree
"" open a new tab and open NERDtree in it
nmap <Leader>e :tabnew<CR>:NERDTree<CR>
"" open NERDTree on vim startup
"autocmd VimEnter * NERDTree


" unbind the cursor keys in insert, normal and visual modes
"for prefix in ['i', 'n', 'v']
"  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
"    exe prefix . "noremap " . key . " <Nop>"
"  endfor
"endfor
