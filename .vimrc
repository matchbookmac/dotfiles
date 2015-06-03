" Configuration file for vim user profile
set modelines=0		" CVE-2007-2438

"color settings
syntax on
:set t_Co=256
:set background=dark
" colorscheme grb4

"tab width
:set expandtab
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set smarttab

hi Comment      term=bold       ctermfg=Yellow      guifg=LightBlue
hi Constant     term=underline  ctermfg=Green       guifg=Green             gui=underline
hi Identifier   term=underline  ctermfg=LightCyan   guifg=DarkCyan
hi Statement    term=bold       ctermfg=Magenta     guifg=Brown             gui=bold
hi PreProc      term=underline  ctermfg=Magenta     guifg=Purple
hi Type         term=underline  ctermfg=DarkGreen   guifg=SeaGreen          gui=bold
hi Special      term=bold       ctermfg=LightBlue   guifg=SlateBlue         gui=underline

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" Set editing settings for vim in terminal
set ruler
set number
set noincsearch
set hlsearch
nohlsearch
