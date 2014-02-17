" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim
" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
"set nu
set tabstop=4
set report=0
set sts=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set nu
set noeb
set cmdheight=2
set completeopt=preview,menu
set laststatus=2

"""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
"如果文件类型为.sh文件 
if &filetype == 'sh' 
  call setline(1,"\#########################################################################") 
  call append(line("."), "\# File Name: ".expand("%")) 
  call append(line(".")+1, "\# Author: kerncai") 
  call append(line(".")+2, "\# mail: kernkerncai@gmail.com") 
  call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
  call append(line(".")+4, "\#########################################################################") 
  call append(line(".")+5, "\#!/bin/bash") 
  call append(line(".")+6, "") 
else 
  call setline(1, "/*************************************************************************") 
  call append(line("."), "    > File Name: ".expand("%")) 
  call append(line(".")+1, "    > Author: kerncai") 
  call append(line(".")+2, "    > Mail: kernkerncai@gmail.com") 
  call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
  call append(line(".")+4, " ************************************************************************/") 
  call append(line(".")+5, "")
endif
 if &filetype == 'cpp'
   call append(line(".")+6, "#include<iostream>")
   call append(line(".")+7, "using namespace std;")
   call append(line(".")+8, "")
endif
 if &filetype == 'c'
   call append(line(".")+6, "#include<stdio.h>")
   call append(line(".")+7, "")
endif
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
endfunc 

"filetype on
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
map <F5> :! d:\python32\python.exe %                  
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
source /etc/vim/vimrc.local
endif

