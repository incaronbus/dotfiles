"" .vimrc
"" GOALS:
    "" Keep hands on the homerow as much as possible
    "" Balance information and aesthetic
    "" Minimize annoyances
    "" Don't break vim
    
"" Backup stuff
set backupdir=$HOME/.vim/backup/ "" Stick all backup files into this directory
set directory=$HOME/.vim/backup/ "" Stick swp files into this directory

if !isdirectory(expand($HOME) . "/.vim/backup/")
    call mkdir(expand($HOME) . "/.vim/backup/")
endif

"" Turn off vi compatibility
set nocompatible             " turn off compatibility mode

"" [[[ LOOKS ]]]
    syntax on
    colorscheme desert

    set number                   " show line numbers

    set showmode                 " show which mode you're in
    set showcmd                  " show commands in status bar
    set ruler<                   " turn on status info
    set laststatus=2             " display the status bar as another line

    "" FILENAME AND STATUS FLAGS
    set statusline=%<%t\ %h%m%r
    "" file type, ascii and hex value under cursor 
    set statusline+=%=%40([%Y]\ [ASCII=\%03.3b]\ [HEX=%02.2B]%) 
    "" current position
    set statusline+=%=%25([%04l,%6(%3c-%-v%)]%)
    set statusline+=%=%4P
    
    "" line wrapping
    set whichwrap=h,l
    set formatoptions=l
    set lbr
    set showbreak=..
    set textwidth=78
    "set nowrap

    "" Show menu with possible tab completions
    set wildmenu
    
"" [[[ INTERACTION ]]]
    "" Enter on normal mode will Open a new line
    nnoremap <CR> o

    "" Allow deleting selection without updating the clipboard
    vnoremap X "_dl
    vnoremap x "_dh
    nnoremap X "_dl
    nnoremap x "_dh

    "" Space and backspace while in normal mode
    nnoremap <Space> i<Space><Right><Esc>
    nnoremap <Backspace> i<Backspace><Right><Esc>

    "" Tab tabs a line forward
    nmap <Tab> >>

    "" Shift tab tabs a line backward
    nmap <S-Tab> <<
    imap <S-Tab> <Esc><<i

    "" Page up and page down
    noremap <C-k> <C-u>
    noremap <C-j> <C-d>

    "" Tabbing forward and backward while in normal mode
    nnoremap <C-t> >> 
    nnoremap <C-d> <<

    "" Soft navigation
    map  <silent> k gk
    imap <silent> <Up> <C-o>gk
    map  <silent> j gj
    imap <silent> <Down> <C-o>gj
    map  <silent> <home> g<home>
    imap <silent> <home> <C-o>g<home>
    map  <silent> <End> g<End>
    imap <silent> <End> <C-o>g<End>

    " CTRL-X and SHIFT-Del are Cut
    vnoremap <C-X>      "+x
    vnoremap <S-Del>    "+x

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C>      "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    map <C-V>		    "+gP
    map <S-Insert>	    "+gP
    cmap <C-V>		    <C-R>+
    cmap <S-Insert>	    <C-R>+
    imap <C-V>		    "+gP
    imap <S-Insert>	    "+gP
    imap <C-v>          <C-r><C-o>+
    imap <S-Insert>     <C-r><C-o>+

    "" F5 runs python
    au FileType python map <F5> :!python %<CR>

"" [[[ AUTOMATIC STUFF ]]]
    set expandtab   " Use spaces instead of tabs
    set smartindent " Smart indenting and unindenting
    set sw=4 " Shift width: number of spaces for each step of indent
    set ts=4 " Tab stop: number of spaces for a tab
    set formatoptions=l

    set showmatch " highlight matching braces
    
    set lbr " Don't automatically insert line breaks while word wrapping

    set ignorecase
    set hlsearch    " Highlight searches
    set incsearch   " Incremental search

    "" Allow the current line to be a different color
    set cursorline!

    "" get rid of the underscore as a keyword
    "set iskeyword-=_

    highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
    highlight StatusLine gui=bold guifg=white guifg=darkblue
    highlight Folded ctermfg=88 ctermbg=NONE cterm=bold
    highlight FoldColumn ctermfg=108 ctermbg=NONE

    au FileType python set nosmartindent autoindent
    
    ""filetype plugin on

"" [[[ GVIM ]]]
if has("gui_running")
    set guioptions-=T
    set guifont=consolas:h10
    
    "" window size
    set lines=50
    set columns=120
    
    "" fix backspace
    set bs=2
    
    "" cpoptions:
    "" get rid of weird backspace delay and
    "" single level undo, among other oddities
    set cpoptions=aABceFs

    "" transparency: requires vimtweak.dll
    function! SetAlpha(alpha)
        call libcallnr("vimtweak.dll", "SetAlpha", a:alpha)
    endfunction
endif
