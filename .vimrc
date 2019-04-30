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

" Colorscheme
Plugin 'altercation/vim-colors-solarized'

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
set listchars=tab:.\ ,trail:.
set list
set tabstop=2
set showtabline=2
set shiftwidth=2
" }}}

" == Folding == {{{
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
