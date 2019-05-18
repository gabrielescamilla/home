" vim: fdm=marker foldminlines=1
"
" == PLUGINS == {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" == Color Scheme == {{{
Plugin 'altercation/vim-colors-solarized'
" Only solarized for now
" }}}

" == Vinegar for netrw == {{{
Plugin 'tpope/vim-vinegar'
" >> Press - in any buffer to hop up to the directory listing and seek to the
" file you just came from. Keep bouncing to go up, up, up. Having rapid
" directory access available changes everything.
" All that annoying crap at the top is turned off, leaving you with nothing
" but a list of files. This is surprisingly disorienting, but ultimately very
" liberating. Press I to toggle until you adapt.
" The oddly C-biased default sort order is replaced with a sensible
" application of 'suffixes'.
" File hiding: files are not listed that match with one of the patterns in
" 'wildignore'.
" If you put let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' in your vimrc,
" vinegar will initialize with dot files hidden. Press gh to toggle dot file
" hiding.
" >> Press . on a file to pre-populate it at the end of a : command line. This is
" great, for example, to quickly initiate a :grep of the file or directory
" under the cursor. There's also !
" >> Press !, which starts the line off with a bang.
" Type !chmod +x and get :!chmod +x path/to/file.
" >> Press y. to yank an absolute path for the file under the cursor.
" >> Press ~ to go home.
" }}}

" == Quick fix == {{{
Plugin 'romainl/vim-qf'
" collection of settings, commands and mappings put together to make working
" with the location list/window and the quickfix list/window smoother
" :help vim-qf
" }}}

" == FZF == {{{
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '/install --all' }
Plugin 'junegunn/fzf.vim'
" }}}

" == IS == {{{
" https://github.com/haya14busa/is.vim
" Incremental search improved - succesor of incsearch.vim
Plugin 'haya14busa/is.vim'
" }}}

" == ASTERISK == {{{
Plugin 'haya14busa/vim-asterisk'
" }}}

" == RAILS == {{{
" Hello world!. Press cs"' inside         => 'Hello world!'
" Press cs'<q> to                         => <q>Hello world!</q>
" To go full circle, press cst"           => \"Hello world!\"
" To remove the delimiters , press ds".   => Hello world!
" Press ysiw] (iw is a text object).      => [Hello] world!
" Press: cs]{                             => { Hello } world!
" Entire line with yssb or yss).          => ({ Hello } world!)
" Revert to the original text: ds{ds)     => Hello world!
" Emphasize hello: ysiw<em>               => <em>Hello</em> world!
" Visual mode. S<p class="important">.    => <p class="important">
"                                               <em>Hello</em> world!
"                                            </p>
Plugin 'tpope/vim-rails'
" }}}

" == MATCHIT == {{{
" Enable matchit.vim for matching more with %
runtime! macros/matchit.vim
" }}}

" == SURROUND == {{{
" Press cs"' inside \"Hello world!\"            => 'Hello world!'
" Press cs'<q>                                  => <q>Hello world!</q>
" Press cst"                                    => \"Hello world!\"
" To remove the delimiters entirely, press ds". => Hello world!
" Press ysiw] (iw is a text object).            => [Hello] world!
" Use } instead of { for no space): cs]{        => { Hello } world!
" Line to parens yssb or yss).                  => ({ Hello } world!)
" Revert to the original text: ds{ds)           => Hello world!
" Emphasize hello: ysiw<em>                     => <em>Hello</em> world!
" In Visual mode. S<p class="important">.       => <p class="important">
"                                                     <em>Hello</em> world!
"                                                  </p>
Plugin 'git://github.com/tpope/vim-surround.git'
" }}}

" == GUTENTAGS == {{{
Plugin 'ludovicchabant/vim-gutentags'
" }}}

" == TAGBAR == {{{
Plugin 'majutsushi/tagbar'
" }}}

" == Example Plugins == {{{
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" }}}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}

" == KEYBOARD == {{{
"  
" Set comma as leader key
let mapleader = ","
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" Use the spaces defined for line tabs in front and <BS>
set smarttab

" visual Linebreak on 500 characters
set lbr
set tw=500

set ai      "Auto indent
set si      "Smart indent
set wrap    "Wrap lines
" }}}

" == EDITOR == {{{
" Enable mouse support
set mouse=a
" large history
set history=1000
set undolevels=1000
" detect type of file and load plugin and indent files for them
filetype plugin indent on
" syntax highlighting
syntax enable
" Set to auto read when a file is changed from the outside
set autoread
" Fast saving
nmap <leader>w :w!<cr>
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
" show changed line count for commands
set report=0
" confirm closing unsaved files
set confirm
" cursor scroll lines margin
set scrolloff=3
" numbers hybrid
set number relativenumber
set numberwidth=1
" color scheme 
set background=dark

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
try 
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
  colorscheme solarized
catch
  try
    colorscheme desert
  catch
  endtry
endtry

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
" Turn on the Wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
" Height of the command bar
set cmdheight=2
" Backspace familiar behavior
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Don't redraw while executing macros (good performance config)
set lazyredraw 
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch 
" No annoying sound on errors
set belloff=all
set noerrorbells
set visualbell
set t_vb=
set tm=500
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" }}}

" == FOLDING == {{{
" Dir to persist folds
set viewdir=$HOME/.vim/view
" Fold options
set foldmethod=syntax
set foldlevel=1
set foldminlines=3
set foldcolumn=1
" From anyfold
set foldtext=MinimalFoldText()
function! MinimalFoldText() abort
	let fs = v:foldstart
	while getline(fs) !~ '\w'
		let fs = nextnonblank(fs + 1)
	endwhile
	if fs > v:foldend
		let line = getline(v:foldstart)
	else
		let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
	endif

	let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
	let foldSize = 1 + v:foldend - v:foldstart
	let foldSizeStr = " " . foldSize . " lines "
	let foldLevelStr = repeat(" + " , v:foldlevel)
	let lineCount = line("$")
	let expansionString = repeat(" " ,w- strwidth(foldSizeStr.line.foldLevelStr))
	return line . expansionString . foldSizeStr . foldLevelStr
endfunction
" Space to toggle folds
nmap <Space> za
" <leader>Space to focus on current fold
nmap <leader><Space> zMzv:set foldminlines=1<cr>
" }}}

" == SEARCH == {{{
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in
"  the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" Search in file
" Hilight the search results
set hlsearch
" Begin searching immediately
set incsearch
" Case insensitive search by default, but switch to case sensitive when searching with uppercase
set ignorecase
set smartcase
" Wrap searching around the EOF and BOF
set wrapscan
" de-highlight from search
map <leader>x :nohlsearch<cr>
" rg / ripgrep
if executable('rg')
  " use rg instead of grep for :grep
  set grepprg=rg\ --no-heading\ --color=never
endif

" Asterisk search word under cursor staying
" map *  <Plug>(asterisk-z*)
" map #  <Plug>(asterisk-z#)
" map g* <Plug>(asterisk-gz*)
" map g# <Plug>(asterisk-gz#)
" To enable keepCursor feature:
" let g:asterisk#keeppos = 1
" }}}

" == FZF == {{{
" :Rg to search in files, with preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>s :Rg<CR>
nnoremap <silent> <leader>r :Rg<CR>
nnoremap <silent> <leader>g :Rg<CR>
nnoremap <silent> <leader>a :Windows<CR>
nnoremap <silent> <leader>t :Windows<CR>
nnoremap <c-p> :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>h :History:<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
imap <C-x><C-f> <plug>(fzf-complete-file)
imap <C-x><C-l> <plug>(fzf-complete-line)
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" }}}


" == BUFFERS == {{{
" Close the current buffer
map <leader>d :Bclose<cr>:tabclose<cr>gT

map <tab> :bnext<cr>
map <S-tab> :bprevious<cr>

" Useful mappings for managing tabs
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" }}}

" == FILES == {{{
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" }}}

" == TAGS == {{{
let g:gutentags_ctags_exclude=["vendor", "bundle", ".git"]
let g:gutentags_ctags_tagfile = ".tags"
" Tagbar
let g:tagbar_autofocus=1
let g:tagbar_compact=1
" Don't map for i or <Space> so my mappings (folding, movement) can work as normal
let g:tagbar_map_togglecaseinsensitive=''
let g:tagbar_map_showproto=''
"let g:tagbar_autoclose=1
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>T :TagbarToggle<CR>
" }}}

" == HELPER FUNCTIONS == {{{
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" }}}

" == STATUS LINE == {{{
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" }}}

" == SPELL CHECK == {{{
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" }}}
