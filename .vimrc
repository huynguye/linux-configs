" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

let mapleader=","

" explicitly set screen color to work better with tmux
set term=screen-256color


set nocompatible
filetype off

scriptencoding utf-8
set encoding=utf-8

syntax enable               " Turn on syntax highlighting
filetype plugin indent on   " Turn on filetype detection

" map ctrl-s to save file
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

" map WQ mistakes
command WQ wq
command Wq wq
command W w
command Q q

" map ,wq for quick write
nnoremap <leader>wq <esc>:wq<cr>

" set background=dark
color devbox-dark-256

set nofoldenable                " disable code folding
let g:DisableAutoPHPFolding = 1 " disable PIV's folding

" Status line setup ------------------------------------------------------
set number                  " Show line numbers
set ruler                   " Show cursor position
set wrap                    " Turn on line wrapping

" Backup control ---------------------------------------------------------
set nobackup                " No backup files (use git)
set nowritebackup           " controls how vim does backups
set noswapfile              " Do not use swap files

" Tab and indent controls ------------------------------------------------
set expandtab
set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4

" Whitespace at end of line controls -------------------------------------
" Highlight trailing whitespace and long lines
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" paragraph reformatting
map q gq}

set backspace=indent,eol,start

set uc=0

"Show command in bottom right portion of the screen
set showcmd

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping
set nowrap

"Highlight searching
set hlsearch

" case insensitive search
set incsearch						" show search matches as you type
set ignorecase						" ignore case when searching
set smartcase						" match case if capital letter used
set copyindent						" copy the previous indention on autoindenting

"Hide mouse when typing
set mousehide

" More useful command-line completion
set wildmenu

"Map escape key to jj -- much faster
imap jj <esc>

set backupdir=~/tmp

" make j and k go between wrapped lines as well instead of skipping them
nmap j gj
nmap k gk

"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

iabbrev </ </<C-X><C-O>


" plugin: crtlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" plugin: tabularize common maps
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>


" plugin syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" plugin: Nerdtree
" command NE NERDTree
nmap <leader>nt :NERDTreeToggle <CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
" quit nerdtree if file closes
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 


" plugin: T-comment (Faster shortcut for commenting)
map <leader>c <C-_><C-_>

" plugin: airline
let g:airline_powerline_fonts = 1   " Airline - powerline font
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h20
let g:airline#extensions#tabline#enabled = 1    " enable nice airline tabs
let g:airline#extensions#tmuxline#enabled = 1
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"

" plugin: tagbar
nmap <F9> :TagbarToggle<CR>
nmap <leader>tb :TagbarToggle<CR>

