set autoindent
set laststatus=2
" change font
set guifont=Andale\ Mono:h14
" show mode at the bottom
set showmode
" disable sound
set visualbell
" disable blinking cursor
set gcr=a:blinkon0
" enable line number
set number
" enable syntax hightlighting
syntax enable
" display tab and trailing spaces
set list listchars=tab:\ \ ,trail:·
"filetype on
"filetype plugin on
"call pathogen#infect()
"let g:NERDTreeChDirMode=2
"let php_sql_query=1                                                                                        
"let php_htmlInStrings=1
set tags=tags,./tags;
set tags+=$HOME/.vim/tags/python.ctags
set tags+=$HOME/.vim/tags/kivy.ctags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set background=dark
colors desert
highlight DiffDelete ctermfg=black ctermbg=red 
highlight DiffAdd ctermfg=black ctermbg=lightgreen 
highlight DiffChange ctermfg=NONE ctermbg=NONE 
highlight DiffText ctermfg=black ctermbg=darkyellow
"source ~/.vim/pyvimrc
set shiftwidth=4
set tabstop=4
set expandtab
"nmap <leader>a <Esc>:Ack!
" highlight current line
set cursorline  
" let edit mode go one character after the end
set virtualedit=onemore
" ruler on steroid
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
" show search as typed
set incsearch
" and ignore case
set ignorecase
" unless uc specified
set smartcase
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

"python << EOF
"import os
"import sys
"import vim
"for p in sys.path:
"    if os.path.isdir(p):
"        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
"EOF

