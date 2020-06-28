call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'itchyny/lightline.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  Plug 'leafgarland/typescript-vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'frazrepo/vim-rainbow'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
call plug#end()

"Config Section
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green
set mouse=a
let g:NERDTreeMouseMode=3

" Splits and Tabbed File
" Remap splits navigation to just CTRL + hjkl 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Semshi Config
function MyCustomHighlights()
 hi semshiLocal           ctermfg=15 guifg=#ffffff
 hi semshiGlobal          ctermfg=15 guifg=#ffffff
 hi semshiImported        ctermfg=15 guifg=#ffffff cterm=bold gui=bold
 hi semshiParameter       ctermfg=214  guifg=#ffaf00
 hi semshiParameterUnused ctermfg=214 guifg=#ffaf00 cterm=underline gui=underline
 hi semshiFree            ctermfg=218 guifg=#ffafd7
 hi semshiBuiltin         ctermfg=51 guifg=#00ffff
 hi semshiAttribute       ctermfg=39  guifg=#00aff
 hi semshiSelf            ctermfg=249 guifg=#b2b2b2
 hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
 hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=Black 
 hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=Red
 hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=Black
 hi Comment               ctermfg=DarkGray
 hi Function              ctermfg=Blue
 hi Special               ctermfg=Magenta
 hi Statement             ctermfg=Magenta
 hi Todo                  ctermfg=Yellow ctermbg=Black
 hi Search                ctermbg=LightBlue
 hi String                ctermfg=Green
 hi Number                ctermfg=173
 hi Boolean               ctermfg=Blue
 hi Error                 ctermbg=Black
 sign define semshiError text=E> texthl=semshiErrorSign
endfunction
autocmd FileType python call MyCustomHighlights()

let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_ctermfgs = ['Yellow', 'Magenta', 'Cyan']
