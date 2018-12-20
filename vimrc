set nocp
call pathogen#infect()
let mapleader = "\<Space>"
set nocompatible
set nomodeline
set viminfo='1000,f1,:1000,/1000
set history=1000

let pair_program_mode = 0

"------  Charset Init  ------
scriptencoding utf-8
set encoding=utf-8

"------  Visual Options  ------
syntax on
set number
set nowrap
set vb
set ruler
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"

" Toggle whitespace visibility with ,s
nmap <Leader>s :set list!<CR>
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
:set list " Enable by default

" <Leader>L = Toggle line numbers
map <Leader>L :set invnumber<CR>

" New splits open to right and bottom
set splitbelow
set splitright


"------  Generic Behavior  ------
set tabstop=4
set shiftwidth=4
set hidden
filetype indent on
filetype plugin on
set autoindent

"allow deletion of previously entered data in insert mode
set backspace=indent,eol,start

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" The search for the perfect color scheme...
map <silent> <Leader>x :RandomColorScheme<CR>

" <Leader>v = Paste
map <Leader>v "+gP

" <Leader>c = Copy
map <Leader>c "+y

" Accidentally pressing Shift K will no longer open stupid man entry
noremap K <nop>

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

" When pressing <Leader>cd switch to the directory of the open buffer
map ,cd :cd %:p:h<CR>

" Wtf is Ex Mode anyways?
nnoremap Q <nop>

" Annoying window
map q: :q

"------  Text Navigation  ------
" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" H = Home, L = End
noremap H ^
noremap L $
vnoremap L g_


"------  Window Navigation  ------
" <Leader>hljk = Move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

"<Leader>= = Normalize window widths
nnoremap <Leader>= :wincmd =<CR>


"------  Buffer Navigation  ------
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" <Leader>q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" <Leader>Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c

" <Leader>Ctrl+q Force Closes the current buffer
nnoremap <silent> <Leader><C-q> :Bclose!<CR>


"------  Searching  ------
set incsearch
set ignorecase
set smartcase
set hlsearch

" Clear search highlights when pressing <Leader>b
nnoremap <silent> <leader>b :nohlsearch<CR>

" http://www.vim.org/scripts/script.php?script_id=2572
" <Leader>a will open a prmompt for a term to search for
noremap <leader>a :Ack 

" <Leader>A will close the new window created for that ack search
noremap <leader>A <C-w>j<C-w>c<C-w>l

let g:ackprg="ag --vimgrep --column"

" CtrlP will load from the CWD, makes it easier with all these nested repos
let g:ctrlp_working_path_mode = ''

" CtrlP won't show results from node_modules
let g:ctrlp_custom_ignore = '\v[\/](node_modules|coverage|target|dist)|(\.(swp|ico|git|svn|png|jpg|gif|ttf))$'

"type S, then type what you're looking for, a /, and what to replace it with
nmap S :%s//g<LEFT><LEFT>
vmap S :s//g<LEFT><LEFT>


"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$', '.git', '.DS_Store', '\.swp$', '\.swo$']

"setting root dir in NT also sets VIM's cd
let NERDTreeChDirMode=2

" Toggle visibility using <Leader>n
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" Focus on NERDTree using <Leader>m
noremap <silent> <Leader>m :NERDTreeFocus<CR>
" Focus on NERDTree with the currently opened file with <Leader>M
noremap <silent> <Leader>M :NERDTreeFind<CR>

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

" Open NERDTree if we're executing vim without specifying a file to open
"autocmd vimenter * if !argc() | NERDTree | endif

" Hides "Press ? for help"
let NERDTreeMinimalUI=1

" Shows invisibles
let g:NERDTreeShowHidden=1


"------  Fugitive Plugin Options  ------
"https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove 
nnoremap <Leader>gp :Ggrep 
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git 
nnoremap <Leader>gd :Gdiff<CR>


"------  Git Gutter Options ------
"Disable <Leader>h* commands as they show down movement
let g:gitgutter_map_keys = 0

"------  Text Editing Utilities  ------
" <Leader>T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>

" <Leader>U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>

" <Leader>R = Converts tabs to spaces in document
map <Leader>R :retab<CR>


"------  JSON Filetype Settings  ------
au BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 0
nmap <silent> =j :%!python -m json.tool<CR>:setfiletype json<CR>
autocmd BufNewFile,BufRead *.webapp set filetype=json
autocmd BufNewFile,BufRead *.jshintrc set filetype=json
autocmd BufNewFile,BufRead *.eslintrc set filetype=json


"------  CoffeeScript Filetype Settings  ------
au BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
au BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw!


"------  JSX Filetype Settings ------
autocmd! BufEnter *.jsx let b:syntastic_checkers=['eslint']
autocmd! BufEnter *.js let b:syntastic_checkers=['eslint']


"------  EJS Filetype Settings  ------
au BufNewFile,BufRead *.ejs set filetype=html


"------  SCSS Filetype Settings  ------
autocmd FileType scss set iskeyword+=-

"------  Markdown Settings  ------
let g:vim_markdown_folding_disabled = 1


let g:airline#extensions#tabline#enabled = 1


" --- VIM

"------  Text File Settings  ------
:autocmd! BufNewFile,BufRead *.txt,*.md,*.tex set wrap


"------  Jenkins Settings  ------
au BufReadPost Jenkinsfile set syntax=groovy
au BufReadPost Jenkinsfile set filetype=groovy


"------  GUI Options  ------
if has("gui_running")
	" Hides toolbar and scrollbars and File menu
	set guioptions=egt

	" Highlights the current line background
	set cursorline
	colorscheme hybrid

	"autocmd VimEnter * TagbarOpen

	" Open VIM in fullscreen window
	set lines=200 columns=500

	" Toggle fullscreen
	map <silent> <leader>w :set lines=200 columns=500<CR>

	" Build all help tags (slower launch, but I run GUI vim like once per day)
	call pathogen#helptags()

	silent! cd $HOME/Projects

	if has("gui_macvim") " OS X
		"set guifont=Monaco:h14
		set guifont=Monaco:h10
		set noantialias
		"set transparency=15

		" Swipe to move between bufers :D
		map <silent> <SwipeLeft> :bprev<CR>
		map <silent> <SwipeRight> :bnext<CR>

		" Cmd+Shift+N = new buffer
		map <silent> <D-N> :enew<CR>

		" Cmd+P = CtrlP
		" TODO: This doesn't actually work, still opens Print dialog
		macmenu File.Print key=<nop>
		nnoremap <silent> <D-p> :CtrlP<CR>

		" Cmd+t = new tab
		nnoremap <silent> <D-t> :tabnew<CR>

		" Cmd+w = close tab (this should happen by default)
		nnoremap <silent> <D-w> :tabclose<CR>

		" Cmd+1...9 = go to that tab
		map <silent> <D-1> 1gt
		map <silent> <D-2> 2gt
		map <silent> <D-3> 3gt
		map <silent> <D-4> 4gt
		map <silent> <D-5> 5gt
		map <silent> <D-6> 6gt
		map <silent> <D-7> 7gt
		map <silent> <D-8> 8gt
		map <silent> <D-9> 9gt

		" OS X probably has ctags in a weird place
		let g:tagbar_ctags_bin='/usr/local/bin/ctags'

		" Damn you scrollwheel paste
		nnoremap <MiddleMouse> <Nop>
		nnoremap <2-MiddleMouse> <Nop>
		nnoremap <3-MiddleMouse> <Nop>
		nnoremap <4-MiddleMouse> <Nop>

		inoremap <MiddleMouse> <Nop>
		inoremap <2-MiddleMouse> <Nop>
		inoremap <3-MiddleMouse> <Nop>
		inoremap <4-MiddleMouse> <Nop>

		" Pair Program mode, so that my coworkers can read my screen ;)
		nnoremap <leader>p :call PairProgramMode()<cr>
		function! PairProgramMode()
			if g:pair_program_mode
				let g:pair_program_mode = 0
				set guifont=Monaco:h10
				set noantialias
				set lines=200 columns=500
			else
				set guifont=Monaco:h15
				set antialias
				set lines=200 columns=500
				let g:pair_program_mode = 1
			endif
		endfunction

	elseif has("gui_gtk2") " Linux
		set guifont=monospace\ 10

		" Alt+n = new buffer
		map <silent> <A-n> :enew<CR>

		" Alt+t = new tab
		nnoremap <silent> <A-t> :tabnew<CR>

		" Alt+w = close tab
		nnoremap <silent> <A-w> :tabclose<CR>

		" Alt+1...9 = go to that tab
		map <silent> <A-1> 1gt
		map <silent> <A-2> 2gt
		map <silent> <A-3> 3gt
		map <silent> <A-4> 4gt
		map <silent> <A-5> 5gt
		map <silent> <A-6> 6gt
		map <silent> <A-7> 7gt
		map <silent> <A-8> 8gt
		map <silent> <A-9> 9gt

	elseif has("gui_win32") " Windows
		" WHAT ARE YOU DOING WITH YOUR LIFE?!
	endif
else
	set t_Co=256
	colorscheme Mustang
	set mouse=a
endif


"------  Local Overrides  ------
if filereadable($HOME.'/.vimrc_local')
	source $HOME/.vimrc_local
endif

" --- kmuthuvel's own tweaks -- 
"------  Local Overrides  ------
if filereadable($HOME.'/.vim/vimrc.extra')
	source $HOME/.vim/vimrc.extra
endif

set ignorecase
set directory=~/.vim/tmp
set modifiable
set shell=/bin/bash
set nolist
nmap <F9> :TagbarToggle<CR>
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>


" Ignore these directories
" set wildignore+=*/out/**
" set wildignore+=*/vendor/**
set wildignore+=*/.git/**


"CtrlP
" Set no max file limit
let g:ctrlp_max_files = 0
" ctrlp_working_path_mode - searching for file name (project/curr_dir)
let g:ctrlp_working_path_mode = 'ra'	" 0 to search only on current dir


" Search in certain directories a large project (hardcoded for now)
" cnoremap %proj <c-r>=expand('~/Projects/some-project')<cr>
" " ga = go api
" map <Leader>ga :CtrlP %proj/api/<cr>
" " gf = go frontend
" map <Leader>gf :CtrlP %proj/some/long/path/to/frontend/code/<cr> 


set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set guifont=Monaco:h14
set guifontwide=NSimsun:h14

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8                     " better default than latin1
  setglobal fileencoding=utf-8           " change default file encoding when writing new files
endif

command -nargs=+ Run :cexpr system("<args>") | copen
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>


cabbrev tabv tab sview +setlocal\ nomodifiable
map <F3>   :Rgrep <CR>
map <S-F3> :tag  <CR>
map <S-C-F>:tag /xyz
map <F4> <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
nnoremap <F5> :R
let notabs = 0
nnoremap <silent> <F6> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
map <F7> :echo 'Current time is ' . strftime('%c')<CR>
set rtp+=~/.fzf


call plug#begin('~/.vim/plugged')
  " Make sure you use single quotes
"Plug 'junegunn/vim-easy-align'									" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'		" Any valid git URL is allowed
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'				" Multiple Plug commands can be written in a single line using | separators
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }			" On-demand loading
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }			" Using a non-master branch
"Plug 'fatih/vim-go', { 'tag': '*' }								" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }		" Plugin options
Plug 'junegunn/fzf',{ 'dir': '~/.fzf', 'do': './install --all'} " Plugin outside ~/.vim/plugged with post-update hook
"Plug '~/my-prototype-plugin'									" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'									" Unmanaged plugin (manually installed and updated)
Plug 'ervandew/supertab'
" Initialize plugin system


Plug 'johngrib/vim-game-snake'

call plug#end()


" toggles the quickfix window.
let g:lt_height = 10
let g:jah_Quickfix_Win_Height = 12
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . g:jah_Quickfix_Win_Height
  endif
endfunction

" used to track the quickfix window
augroup QFixToggle
 autocmd!
 autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
 autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END
nmap <silent> ` :QFix<CR>



set laststatus=2				" always show the Airline

"Theme
let g:airline_theme='wombat' 	" try simple powerlineish ,solarized & more. [Help] :AirlineTheme <keyword>

color adam 					"	solarized	vim theme [Tip] :color <keyword>

set completeopt=longest,menuone
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd  FileType  php setlocal omnifunc=phpcomplete#CompletePHP
"autocmd VimEnter * TagbarOpen
"autocmd VimEnter * NERDTree

if enduser_utf8_support
    let g:airline_right_sep = '◀'
    let g:airline#extensions#tabline#right_sep = '◀'
    let g:airline#extensions#tabline#right_alt_sep = '◀'
    let g:airline_left_sep = '▶'
    let g:airline#extensions#tabline#left_sep = '▶'
    let g:airline#extensions#tabline#left_alt_sep = '▶'
elseif !enduser_utf8_support
    let g:airline_right_sep = '◆'
    let g:airline#extensions#tabline#right_sep = '◆'
    let g:airline#extensions#tabline#right_alt_sep = '◆'
    let g:airline_left_sep = '░'
    let g:airline#extensions#tabline#left_sep = '░'
    let g:airline#extensions#tabline#left_alt_sep = '▒'

    " http://vimhelp.appspot.com/digraph.txt.html " Ctrl-K Dt for ▼   (also use :digraph )
    let g:NERDTreeDirArrowExpandable = '»'
    let g:NERDTreeDirArrowCollapsible = '▼'   "let g:NERDTreeDirArrowCollapsible = '-'
	" Tagbar symbols
	let g:tagbar_iconchars = ['+', '-']
endif



" :Shell <command>
function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

autocmd  FileType  php setlocal omnifunc=phpcomplete#CompletePHP

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

"let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabDefaultCompletionType = "<c-n>"
inoremap <Tab> <C-n>

autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
set completeopt=longest,menuone
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set wildmenu
set paste

"Numbers in the title bar 
let g:airline#extensions#tabline#buffer_nr_show =1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#fnamecollapse = 1
"let g:airline#extensions#tabline#fnamemod = ':p:.'

" `GNU/screen` options
if &term =~ '256color'
" disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color GNU screen.
	set t_ut=
endif

set runtimepath^=~/.vim/bundle/bbye		" use Bdelete/Bwipeout instead of bdelete/bwipeout

let g:airline#extensions#tabline#buffer_nr_show =1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#fnamecollapse = 1
"let g:airline#extensions#tabline#fnamemod = ':p:.'

if using_putty
	" https://unix.stackexchange.com/a/1764/152264
	" https://unix.stackexchange.com/questions/1709/how-to-fix-ctrl-arrows-in-vim
	" resize horzontal/vertical split window - from PuTTY - WARNING - HARDCODED
	map [A <C-W>-<C-W>-
	map [B <C-W>+<C-W>+
	map [C <C-W>><C-W>>
	map [D <C-W><<C-W><
elseif !using_putty
	" resize horzontal split window
	nmap <C-Up> <C-W>-<C-W>-
	nmap <C-Down> <C-W>+<C-W>+
	" resize vertical split window
	nmap <C-Left> <C-W>><C-W>>
	nmap <C-Right> <C-W><<C-W><

endif
