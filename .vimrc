" automatic reload .vimrc
autocmd! bufwritepost .vimrc source %


" rebind <Leader> key
let mapleader = ","


" enable line number
set number


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


" color scheme
"" mkdir -p ~/.vim/colors && cd ~/.vim/colors
"" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" enable syntax highlighting
"filetype off
filetype plugin indent on
syntax on


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

" HTML
"" indentation
autocmd FileType html setlocal indentkeys-=*<Return>

" JSON[iq]
"" set JSON syntax highlighting for *.jq. *.jqy
autocmd BufNewFile,BufReadPost *.jq set syntax=javascript
autocmd BufNewFile,BufReadPost *.jqy set syntax=javascript

" word wrap for *.txt
autocmd BufReadPost,BufWritePost *.txt set wrap linebreak nolist 

" settings an commands for tex
"" build and show pdf
autocmd BufReadPost,BufWritePost *.tex nmap <Leader>b :w<CR>:!PDF="%<.pdf" && "/usr/texbin/pdflatex" -synctex=1 -interaction=nonstopmode "%" && open "$PDF" && unset PDF<CR>
autocmd BufReadPost,BufWritePost *.tex nmap <Leader>c :!echo "cleaning enviroment" && find . \| grep -vE "(^..$)\|(^.$)\|(.tex$)" \| xargs rm<CR><CR>
autocmd BufReadPost,BufWritePost *.tex set omnifunc=LatexBox_Complete
let g:LatexBox_complete_inlineMath = 1
let g:syntastic_mode_map = {'passive_filetypes': ['tex'] }


"" word wrap
autocmd BufReadPost,BufWritePost *.tex set wrap linebreak nolist 


" commands for bash development
"" run bash script
auto BufReadPost,BufWritePost *.sh nmap <Leader>b :w<CR>:!./"%" <CR>

" commands for cpp development
"" make (all)
auto BufReadPost,BufWritePost *.cpp,*.h nmap <Leader>b :w<CR>:make<CR>
auto BufReadPost,BufWritePost *.cpp,*.h nmap <Leader>c :w<CR>:make clean<CR><CR>

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
                                                            
inoremap <expr> <Nul> Auto_complete_string()
inoremap <expr> <C-Space> Auto_complete_string()

set omnifunc=syntaxcomplete#Complete

" tell vim to remember certain things when we exit
"" '10  :  marks will be remembered for up to 10 previously edited files
""  "100 :  will save up to 100 lines for each register
""  :20  :  up to 20 lines of command-line history will be remembered
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


" pathogen to manage plugins
"" mkdir -p ~/.vim/autoload ~/.vim/bundle
"" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
"" to install a new plugin, just into .vim/bundle/PLUGIN_NAME
call pathogen#infect()


" plugin vim-powerline
"" cd ~/.vim/bundle
"" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
"let g:Powerline_symbols = 'fancy'


" plugin syntastic (syntax checker)
"" cd ~/.vim/bundle
"" git clone https://github.com/scrooloose/syntastic.git


" plugin ctrlp
"" cd ~/.vim/bundle
"" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 10
