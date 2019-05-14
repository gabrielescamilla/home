" vim: fdm=marker foldminlines=1
"
" == PLUGINS == {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" -- plugin start -- {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" }}}

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
Plugin 'haya14busa/is.vim'
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

" -- plugin end --- {{{
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
" Set comma as leader key
let mapleader = ","
" }}}

" == EDITOR == {{{
" Enable mouse support
set mouse=a
" large history
set history=1000
set undolevels=1000
" show changed line count for commands
set report=0
" confirm closing unsaved files
set confirm
" cursor scloll lines margin
set scrolloff=3
" numbers hybrid
set number relativenumber
set numberwidth=1
" syntax highlighting
syntax enable
set background=dark
" color scheme 
let g:solarized_termcolors=256
colorscheme solarized
" to see spaces
"
"
"
filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
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
" }}}
