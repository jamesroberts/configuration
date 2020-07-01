call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'itchyny/lightline.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'gabrielelana/vim-markdown'
  Plug 'leafgarland/typescript-vim'
  Plug 'frazrepo/vim-rainbow'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-vinegar'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"Config Section
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set hlsearch
set incsearch
set smartcase
set nowrap
set noswapfile
set ruler
set nofoldenable
set mouse=a
set guicursor=
set noerrorbells
set path+=**
set wildmenu
set wildignore+=*/node_modules/*,*/__pycache__/*,*/venv/*,*/build/*

" CtrlP Settings 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'

" Shortcuts and Keybinding
let mapleader = " "
nnoremap <leader>e :Explore<Return>
nnoremap <leader>ff :CtrlP<Return>
nnoremap <leader>fo :CtrlPMixed<Return>

hi SignColumn             ctermbg=Black
hi VertSplit              cterm=NONE ctermfg=DarkGray
hi EndOfBuffer            ctermfg=Black
hi Directory              ctermfg=Blue
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
 hi Pmenu                 ctermbg=235 ctermfg=255 guibg=#080808 
 hi PmenuSel              ctermbg=237 ctermfg=255
 hi PmenuSbar             guibg=#bcbcbc
 hi PmenuThumb            guibg=#585858
 hi CocWarningFloat       ctermfg=Yellow
 hi SignColumn            ctermbg=Black
 hi CocHighlightText      ctermbg=Black
 hi Directory ctermfg=LightBlue
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

" Conquer of Completion settings
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-python',
  \ ]

"TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


set encoding=utf8
set guifont=DroidSansMono:h20

hi NerdTreeCWD ctermfg=Green
hi Directory ctermfg=LightBlue

