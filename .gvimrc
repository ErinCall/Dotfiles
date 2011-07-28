autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight HardTabs ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match HardTabs /\t/
autocmd InsertEnter * match HardTabs /\t/
autocmd InsertLeave * match HardTabs /\t/
autocmd BufWinLeave * call clearmatches()

colorscheme torte
set transparency=15
set guifont=Monaco:h12
