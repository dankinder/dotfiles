set nocompatible  " enable vim specific commands
 
set noeb " disable error bells
set novb " don't blink the screen when there is an error
set backspace=indent,eol,start  " backspacing over indention, end-of-line 
                                            "and start-of-line
set autoindent
set smartindent

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
set tabstop=8 " tab size
set smarttab
set shiftround
set showmatch
set guioptions-=T
set so=2  " keep at least 2 lines of space around the cursor

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
 
syn on " automatic syntax hilighting

autocmd BufRead,BufNewFile *.txt set filetype=text
autocmd BufRead,BufNewFile *.txt set linebreak
autocmd BufRead,BufNewFile *.txt set nonumber
autocmd BufRead,BufNewFile *.txt set foldmethod=marker

" Playing around with highlighting Bible verses and notes
"
" autocmd BufRead,BufNewFile *.txt syntax match Function "\(Gen\(esis\)\?\|Exod\(us\)\?\|Lev\(iticus\)\?\|Num\(bers\)\?\|Deut\(eronomy\)\?\|Josh\(ua\)\?\|Judg\(es\)\?\|Ruth\|\(1\|I\)\(\s\)\?Sam\(uel\)\?\|\(2\|II\)\(\s\)\?Sam\(uel\)\?\|\(1\|I\)\(\s\)\?K\(in\)\?gs\|\(2\|II\)\(\s\)\?K\(in\)\?gs\|\(1\|I\)\(\s\)\?Chr\(o\)\?\(nicles\)\?\|\(2\|II\)\(\s\)\?Chr\(o\)\?\(nicles\)\?\|Ezra\|Neh\(emiah\)\?\|Esth\(er\)\?\|Job\|Ps\(a\)\?\(lm\)\?\|Prov\(erbs\)\?\|Ecc\(l\)\?\(esiastes\)\?\|Song\( of Solomon\)\?\|Isa\(iah\)\?\|Jer\(emiah\)\?\|Lam\(entations\)\?\|Ezek\(iel\)\?\|Dan\(iel\)\?\|Hos\(ea\)\?\|Joel\|Amos\|Obad\|Jonah\|Mic\(ah\)\?\|Nah\(um\)\?\|Hab\(akkuk\)\?\|Zeph\(aniah\)\?\|Hag\(gai\)\?\|Zech\(ariah\)\?\|Mal\(achi\)\?\|Matt\(hew\)\?\|Mark\|Luke\|\(\?<!\(1\|2\|3\|I\)\s\)\(\?<!\(1\|2\|3\|I\)\)John\|Acts\|Rom\(ans\)\?\|\(1\|I\)\(\s\)\?Cor\(inthians\)\?\|\(2\|II\)\(\s\)\?Cor\(inthians\)\?\|Gal\(atians\)\?\|Eph\(esians\)\?\|Phil\(ippians\)\?\|Col\(ossians\)\?\|\(1\|I\)\(\s\)\?Thess\(alonians\)\?\|\(2\|II\)\(\s\)\?Thess\(alonians\)\?\|\(1\|I\)\(\s\)\?Tim\(othy\)\?\|\(2\|II\)\(\s\)\?Tim\(othy\)\?\|Tit\(us\)\?\|Phile\(mon\)\?\|Heb\(rews\)\?\|Ja\(me\)\?s\|\(1\|I\)\(\s\)\?Pet\(er\)\?\|\(2\|II\)\(\s\)\?Pet\(er\)\?\|\(\(1\|I\)\(\s\)\?\)John\|\(\(2\|II\)\(\s\)\?\)John\|\(\(3\|III\)\(\s\)\?\)John\|Jude\|Rev\(elation\)\?\(\sof Jesus Christ\)\?\)\s*\d{1,3}\(\s*:\s*\d{1,3}\)\?\(\s*-\s*\d{1,3}\?\(\s*:\s*\)\?\(\d{1,3}\)\?\)\?"
" autocmd BufRead,BufNewFile *.txt syntax match Function "(Gal(?:atians)?|Eph(?:esians)?)\s*\d{1,3}(?:\s*:\s*\d{1,3})?(?:\s*-\s*(\d{1,3}(?=\s*:\s*))?(?:\s*:\s*)?(\d{1,3})?)?"
" autocmd BufRead,BufNewFile *.txt syntax match Identifier "^[^ ]*:$"
" autocmd BufRead,BufNewFile *.txt syntax match Special "^\d*/\d*/\d* |[^|]*| .*$"
" autocmd BufRead,BufNewFile *.txt syntax region String start="^2 Corinthians [0-9,:-]*$" end="^$"
" autocmd BufRead,BufNewFile *.txt syntax region String start="^  - " end="^$"

autocmd Filetype python set tabstop=4
autocmd Filetype python set shiftwidth=4

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>_
set wmh=0

colorscheme koehler
filetype plugin on
set ofu=syntaxcomplete#Complete

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
