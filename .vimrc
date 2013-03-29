map! gcr <Esc>

autocmd BufEnter * lcd %:p:h
set nocompatible
set backspace=2        " (bs) allow backspacing over everything in insert mode
set viminfo='20,\"50    " (vi) read/write a .viminfo file, don't store more
            " than 50 lines of registers
set history=50        " (hi) keep 50 lines of command line history
set ruler        " (ru) show the cursor position all the time
set mouse=a

set virtualedit=block
set expandtab
set ts=4
set sw=4
set ai
set incsearch " move the screen to matching search results as you are typing the search
set ignorecase
set smartcase
set nohlsearch
set noeb
set nowrap
set hidden
set foldmethod=indent
set nofen
set pastetoggle=<F11>
set whichwrap=b,s,h,l,<,>,[,]       " No left/right key should have to stop at line breaks
set smarttab
set scrolloff=10
set wildmenu
set wildmode=list:longest
set title

set runtimepath^=~/.vim/bundle/ctrlp.vim
call pathogen#infect()
filetype plugin indent on
autocmd BufNewFile,BufWinEnter Gemfile set filetype=ruby
autocmd BufNewFile,BufWinEnter *.json set filetype=javascript

map ,gd :w<Cr>:!git dif % <cr>
map ,b :BufExplorer<cr>
map ,o o<Esc>
map ,O O<Esc>
map ,<Space> a<Space><Esc>
map! ,<Space> ,<Space>
map ,# :s/^/#/<Cr>
nmap ,# I#<Esc>
map! ,# ,#
map ,conf mxvi{<Esc>j%o<Esc>0iuse Carp; local $SIG{__DIE__} = \&confess;<Esc>'x
map ,dp ouse Data::Dumper; warn Dumper ;<Esc>i
nmap ,eq V:s/assert /eq_(<Cr>:'<,'>s/\s*==\s*/, <Cr>:'<,'>s/$/)<Cr>
vmap ,eq :s/assert /eq_(<Cr>:'<,'>s/\s*==\s*/, <Cr>:'<,'>s/$/)<Cr>
map! ,eq ,eq
map ,sp :set paste!<Cr>
map <silent> ,wt :%s/\s\+$<Cr>
map <silent> ,aao :%s/\t/    /g<Cr>
map <silent> <C-N> :set hlsearch!<CR>

"surround visual selection with paired characters. Thanks akr!
vmap ,( <ESC>`>a)<ESC>`<i(<ESC>
vmap ,< <ESC>`>a><ESC>`<i<<ESC>
vmap ," <ESC>`>a"<ESC>`<i"<ESC>
vmap ,' <ESC>`>a'<ESC>`<i'<ESC>
vmap ,{ <ESC>`>a}<ESC>`<i{<ESC>
vmap ,[ <ESC>`>a]<ESC>`<i[<ESC>

set bg=dark
syntax on

set ch=2                " Make command line two lines high
highlight StatusLine ctermfg=darkblue ctermbg=grey
set statusline=[%n]\ %.200F\ %(\ %M%R%H)%)\ \@(%l\,%c%V)\ %P
set laststatus=2        " always show status line

map ,v :sp ~/.gvimrc<CR><C-W>_:vs ~/.vimrc<Cr>
map <silent> ,V :source ~/.vimrc<CR>:source ~/.gvimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
