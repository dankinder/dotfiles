set nocompatible  " enable vim specific commands

set noerrorbells " disable error bells
set visualbell " disable error bells
set t_vb= " disable the error bells, for real guys
set backspace=indent,eol,start  " backspacing over indention, end-of-line and start-of-line

set autoindent " standard indent behavior for non-recognized filetypes
set nu  " set line numbering on
set fileformat=unix  " use the unix fileformat
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position in the bottom right corner
set showcmd  " display incomplete commands
set hidden " enable hidden files
set incsearch " show partial searches real-time
set magic " enable advanced regular expression in searches
set shiftwidth=2 " number of spaces used with (auto)indention
set expandtab
set tabstop=4 " tab size
set smarttab
set shiftround
set showmatch
set guioptions-=T
set so=2  " keep at least 2 lines of space around the cursor
set laststatus=2 " always show the status bar
set winminheight=0 " Allow split windows to go to 0 height
set wildmenu " better command-line completion
set cmdheight=2 " command window height; avoids 'press <Enter> to continue' sometimes

set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
 
syntax on " automatic syntax hilighting
filetype indent plugin on " try to automatically figure indenting out

autocmd BufRead,BufNewFile *.txt set filetype=text
autocmd BufRead,BufNewFile *.txt set linebreak
autocmd BufRead,BufNewFile *.txt set nonumber
autocmd BufRead,BufNewFile *.txt set foldmethod=marker

autocmd Filetype python set tabstop=4
autocmd Filetype python set shiftwidth=4
autocmd Filetype python set foldmethod=indent
autocmd Filetype cs set tabstop=4
autocmd Filetype cs set shiftwidth=4
autocmd Filetype aspx set tabstop=4
autocmd Filetype aspx set shiftwidth=4

" Multi-file method 1: tabs
map <C-H> :tabNext<CR>
map <C-L> :tabnext<CR>

" Mult-file method 2: splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
"map <C-H> <C-W>_

set background=dark
colorscheme solarized
filetype plugin on
set ofu=syntaxcomplete#Complete

let g:notes_directories = ['~/notes']
let g:notes_suffix = '.txt'

if has("cscope")
  " set csprg=/usr/local/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif
map g<C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>

execute pathogen#infect()
