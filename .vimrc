" automatic reload .vimrc
autocmd! bufwritepost .vimrc source %

" VBundle
set nocompatible 
filetype off 

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" plugins on GitHub repo
Plugin 'scrooloose/syntastic'

" plugin vim-powerline git://github.com/Lokaltog/vim-powerline.git
Plugin 'Lokaltog/vim-powerline'
set laststatus=2
"let g:Powerline_symbols = 'fancy'

" plugin ctrlp (https://github.com/kien/ctrlp.vim)
Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_height = 10

" plugin LaTeX-Box
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" plugin phpcomplete
"" cd ~/.vim/bundle
"" git clone git://github.com/shawncplus/phpcomplete.vim.git
Plugin 'shawncplus/phpcomplete.vim'
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" rebind <Leader> key
let mapleader = ","


" enable mouse
set mouse=a


" change backspace behavoir
set bs=2


" unbind the cursor keys in insert, normal and visual modes
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor


" search
"" turn on incremental search
set incsearch
"" ignorecase while searching
set ignorecase


" quick quit (in normal mode)
nmap <Leader>q :quit<CR>


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


" ctags
"" this will open the file where the keyword under the cursor is defined
nmap <Leader>d <Leader>ulbye:10sp<CR>:tag <C-R>"<CR>
"" update tags file
nmap <Leader>u :let &tags=system('${HOME}/.vimrc.d/update_ctags.sh')<CR>:echo "tags was set to"&tags<CR>

" split
"" split horizontally
nmap <Leader>h :split<CR>
"" CTRL+W is ,w
nmap <Leader>w <c-w>


" sort selection in visual mode
vnoremap <Leader>s :sort<CR>


" better indentation in visual mode
"" move tab left
vnoremap < <gv
"" move tab right
vnoremap > >gv


" indentation
set autoindent
set cindent


" tabstop settings
"" smart indent
set smartindent
"" set width of \t to 4
set tabstop=4
"" set indent width to 4
set shiftwidth=4
"" number of columns for a TAB
set expandtab


" show trailing white space
"" MUST be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

" enable syntax highlighting
"filetype off
filetype plugin indent on
syntax enable


" color scheme
"" mkdir -p ~/.vim/colors && cd ~/.vim/colors
"" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod
"set background=dark
"colorscheme solarized

" enable line number
set number
"hi LineNr ctermfg=Cyan ctermbg=DarkGrey

" code folding
"" fold based on indent
set foldmethod=indent
"" deepest fold level
set foldnestmax=10
"" dont fold by default
set nofoldenable
"" fold level
set foldlevel=2
"" shortcuts for code folding
"" toggle folding
nmap <Leader>f za
"" fold all
nmap <Leader>F zM
"" keep folding
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview


" settings for line length
"" width of document
set tw=79
"" don't automatically wrap on load
set nowrap
"" don't automatically wrap text while writing
set fo-=t
"" show a column at pos 80
set colorcolumn=80
"" color of color column (dark grey)
highlight ColorColumn ctermbg=233

" haskell
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
au BufEnter *.hs compiler ghc
au BufEnter *.hs hi Normal ctermfg=186


" HTML
"" indentation
autocmd FileType html setlocal indentkeys-=*<Return>

" JSON[iq]
"" set JSON syntax highlighting for *.jq. *.jqy
autocmd BufNewFile,BufReadPost *.jq set syntax=javascript
autocmd BufNewFile,BufReadPost *.jqy set syntax=javascript

" LISA
"" set C syntax hightlight for *.lisa
autocmd BufNewFile,BufReadPost *.lisa set syntax=lisa

" Verilog
"" abbreviation for block comment
"iab /*--- /* -------------------------------------------------------------------------<Esc>:set paste<CR>m`o<Esc>``:set nopaste<CR>i
iab /*--- /* -------------------------------------------------------------------------<Esc>:set paste<CR>m`o *<Esc>m`o * ------------------------------------------------------------------------- */<Esc>:set nopaste<Esc>ka

" word wrap for *.txt
autocmd BufReadPost,BufWritePost *.txt set wrap linebreak nolist 

" settings an commands for tex
"" build and show pdf
autocmd BufReadPost,BufWritePost *.tex nmap <Leader>b :w<CR>:!PDF="%<.pdf" && "/usr/texbin/pdflatex" -synctex=1 -interaction=nonstopmode "%" && open "$PDF" && unset PDF<CR>
autocmd BufReadPost,BufWritePost *.tex nmap <Leader>v :w<CR>:!PDF="%<.pdf" && "/usr/texbin/xelatex" -synctex=1 -interaction=nonstopmode "%" && open "$PDF" && unset PDF<CR>
autocmd BufReadPost,BufWritePost *.tex nmap <Leader>c :w<CR>:!PDF="%<.pdf" && make && open "$PDF" && unset PDF<CR>
autocmd BufReadPost,BufWritePost *.tex set omnifunc=LatexBox_Complete
let g:LatexBox_complete_inlineMath = 1
let g:syntastic_mode_map = {'passive_filetypes': ['tex'] }

" bachelorarbeit
autocmd BufReadPost,BufWritePost {bachelorarbeit,sec*}.tex nmap <Leader>v :set noignorecase<CR>:%s/ä/"a/ge<CR>:%s/ö/"o/ge<CR>:%s/ü/"u/ge<CR>:%s/Ä/"A/ge<CR>:%s/Ö/"O/ge<CR>:%s/Ü/"U/ge<CR>:%s/ß/\\ss/ge<CR>:w<CR>:set ignorecase<CR>:!"/usr/texbin/pdflatex" -synctex=1 -interaction=nonstopmode bachelorarbeit && open bachelorarbeit.pdf && unset PDF<CR>
autocmd BufReadPost,BufWritePost {bachelorarbeit,sec*}.tex nmap <Leader>c :set noignorecase<CR>:%s/ä/"a/ge<CR>:%s/ö/"o/ge<CR>:%s/ü/"u/ge<CR>:%s/Ä/"A/ge<CR>:%s/Ö/"O/ge<CR>:%s/Ü/"U/ge<CR>:%s/ß/\\ss/ge<CR>:w<CR>:set ignorecase<CR>:!PDF="%<.pdf" && make && open bachelorarbeit.pdf && unset PDF<CR>

"autocmd BufReadPost,BufWritePost bachelorarbeit.tex nmap <Leader>c :w<CR>:%s/ü/"u/g | !PDF="%<.pdf" && make && open "$PDF" && unset PDF<CR>

"" word wrap
autocmd BufReadPost,BufWritePost *.tex set wrap linebreak nolist 


" settings for R
"" run R script
autocmd BufReadPost,BufWritePost *.R nmap <Leader>b :w<CR>:!R --no-save < %<CR>

"" no word wrap
autocmd BufReadPost,BufWritePost *.R set nowrap


" sql commands
" inoremap <C-c> <ESC>

" commands for bash development
"" run bash script
auto BufReadPost,BufWritePost *.sh nmap <Leader>b :w<CR>:!./"%" <CR>

" commands for cpp development
"" make (all)
auto BufReadPost,BufWritePost *.cpp,*.h nmap <Leader>b :w<CR>:make<CR>

function! Auto_complete_string()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
    end
endfunction
                                    
function! Auto_complete_opened()
    if pumvisible()
        return "\<Down>"
    end
    return ""
endfunction
                                                            
"inoremap <expr> <Nul> Auto_complete_string()
inoremap <expr> <C-Space> Auto_complete_string()

inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

set completeopt=longest,menuone
"set omnifunc=syntaxcomplete#Complete

" tell vim to remember certain things when we exit
"" '10  :  marks will be remembered for up to 10 previously edited files
""  "100 :  will save up to 100 lines for each register
""  :200 :  up to 20 lines of command-line history will be remembered
""  %    :  saves and restores the buffer list
""  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

