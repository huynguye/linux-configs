" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'

let mapleader=","

" set ctags to look up until it finds a tags file
set tags=tags;

" system stuff
set term=screen-256color
set nocompatible
scriptencoding utf-8
set encoding=utf-8

syntax enable               " Turn on syntax highlighting
filetype plugin indent on   " Turn on filetype detection
set background=dark

" let g:solorized_termcolors=256
" colorscheme solarized
" colors twilight256
" color devbox-dark-256
" color desert256
" colors seoul256
let g:gruvbox_italic=0
colorscheme gruvbox
" colors desert
" color dracula

" map ctrl-s to save file
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>

" kill whitespace
nnoremap <leader>ws :%s/\s\+$//e<CR>

" in case forget to sudo edit a root file, just do w!! to save
cmap w!! w !sudo tee % >/dev/null

" map WQ mistakes
" command WQ wq
" command Wq wq
" command W w
" command Q q

" quickly enable/disable paste mode
set pastetoggle=<F2>

" map ,wq for quick write
nnoremap <leader>wq <esc>:wq<cr>

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
" set expandtab
set autoindent " always auto indent
set copyindent " copy the previous indention on autoindenting
set showmatch  " set show matching parenthesis
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4


" Terminal stuff
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
" set title                " change the terminal's title
" set visualbell           " don't beep
" set noerrorbells         " don't beep


" Whitespace at end of line controls -------------------------------------
" Highlight trailing whitespace and long lines
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" paragraph reformatting
" map q gq}

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
nmap <silent> ,/ :nohlsearch<CR>

" case insensitive search
set incsearch						" show search matches as you type
set ignorecase						" ignore case when searching
set smartcase						" match case if capital letter used

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

nmap <leader>nn :set invnumber<CR>
nmap <leader>24 :set ts=2 sts=2 noet<CR>:retab!<CR>:set ts=4 sts=4 et<CR>:retab!<CR>
nmap <leader>ww :set invwrap<CR>

" Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h
" map ,cd :cd %:p:h<CR>

iabbrev </ </<C-X><C-O>

" buffers
set hidden
nmap <leader>T :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
" nmap :q :bp <BAR> bd #<CR>

" tabs
nmap <leader>tq :tabclose<CR>

" plugin: crtlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.bak     " MacOSX/Linux
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'
nmap <leader>p :CtrlP<CR>
" Setup some default ignores
let g:ctrlp_custom_ignore = {
\  'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
\  'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\  }
" Easy bindings for its various modes (searh buffer, mixed or buffers by most
" recently used)
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>


" plugin: tabularize common maps
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>a{ :Tabularize /{<CR>
vmap <Leader>a{ :Tabularize /{<CR>
nmap <Leader>a' :Tabularize /'<CR>
vmap <Leader>a' :Tabularize /'<CR>
nmap <Leader>a. :Tabularize /.<CR>
vmap <Leader>a. :Tabularize /.<CR>
nmap <Leader>a? :Tabularize /?<CR>
vmap <Leader>a? :Tabularize /?<CR>
nmap <Leader>a/ :Tabularize /\/\/<CR>
vmap <Leader>a/ :Tabularize /\/\/<CR>
nmap <Leader>a# :Tabularize /#<CR>
vmap <Leader>a# :Tabularize /#<CR>


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
" nmap <leader>nt :NERDTreeToggle <CR>
map <Leader>nt <plug>NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeBookmarksSort=0
" quit nerdtree if file closes
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" plugin: T-comment (Faster shortcut for commenting)
map <leader>c <C-_><C-_>

" plugin: airline
let g:airline_powerline_fonts = 1   " Airline - powerline font
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h20
let g:airline#extensions#tabline#enabled = 1    " enable nice airline tabs
let g:airline#extensions#tabline#fnamemod = 1   " show jsut the filename 
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

" plugin: snipmatesreload snipmates
nnoremap <F7> :call ReloadAllSnippets()


" plugin: neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3


" plugin: neosnippets
	" disable default neosnippets
	" let g:neosnippet#disable_runtime_snippets = 0
    "
	" " Enable snipMate compatibility feature.
	" let g:neosnippet#enable_snipmate_compatibility = 1
    "
	" " Tell Neosnippet about the other snippets
	" let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate.vim/snippets'
    "
	" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
	" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
	" xmap <C-k>     <Plug>(neosnippet_expand_target)
    "
	" " SuperTab like snippets behavior.
	" imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
	" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    "
	" " For snippet_complete marker.
	" if has('conceal')
	"   set conceallevel=2 concealcursor=i
	" endif

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

