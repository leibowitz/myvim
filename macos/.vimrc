set nu
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set smarttab
set shiftround
"set autochdir
"set transp=15
"set autochdir
set showmatch
set ruler
set autowrite
set tags=./tags;/,$HOME/vimtags
"let g:easytags_dynamic_files = 2
set laststatus=2
"autocmd vimenter * NERDTree


syntax on
filetype on
filetype plugin indent on
execute pathogen#infect()
"call pathogen#infect()
"call pathogen#helptags()


highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
"highlight DiffAdd cterm=NONE ctermfg=black ctermbg=Green gui=NONE guifg=bg guibg=Green
"highlight DiffDelete cterm=NONE ctermfg=white ctermbg=Red gui=NONE guifg=bg guibg=Red
"highlight DiffChange cterm=NONE ctermfg=white ctermbg=Yellow gui=NONE guifg=bg guibg=Yellow
"highlight DiffText cterm=NONE ctermfg=white ctermbg=Magenta gui=NONE guifg=bg guibg=Magenta

highlight ExtraWhitespace ctermbg=darkred guibg=darkred

"colorscheme delek
"colorscheme desert
colorscheme torte
"darkblue


hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green'
hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red'
hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow'


" Show trailing whitespace:
match ExtraWhitespace /\s\+$/
" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" ignore white space in vimdiff
if &diff
    set diffopt+=iwhite
endif


"let loaded_netrw = 1
let g:netrw_menu = 0
let g:netrw_preview   = 1
let g:netrw_winsize   = 40
let g:netrw_liststyle = 3
let g:netrw_altv      = 1
let g:netrw_browse_split = 4
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

let g:svndiff_autoupdate = 1


" echo &filetype
if &filetype == 'php'
endif
if &filetype == 'python'
else
	" Show spaces used for indenting (so you use only tabs for indenting).
	"match ExtraWhitespace /^\t*\zs \+/
	" Show tabs that are not at the start of a line:
	"this regex is broken, doesnt do what it says

	"match ExtraWhitespace /[^\t]\zs\t\+/
endif

" Gui Font
set guifont=Consolas:h15

" Switch off :match highlighting.
"match
au BufRead,BufNewFile *.twig set filetype=jinja
au BufRead,BufNewFile *.html.twig set filetype=htmljinja

"autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType js,php autocmd BufWritePre <buffer> :%s/\s\+$//e
" close NerdTREE if only buffer open
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" open bookmarks when starting
let NERDTreeShowBookmarks=1
" cd to bookmark directory
let NERDTreeChDirMode=2

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction



function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
