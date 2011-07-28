autocmd ColorScheme * highlight BadWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match BadWhitespace /\s\+$\|\t/
autocmd InsertEnter * match BadWhitespace /\s\+\%#\@<!$\|\t/
autocmd InsertLeave * match BadWhitespace /\s\+$\|\t/
autocmd BufWinLeave * call clearmatches()

colorscheme torte
set transparency=15
set guifont=Monaco:h12
set guioptions-=T "No toolbar in gvim
