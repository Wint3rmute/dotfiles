:set guicursor=
":colo baczek  
" A comment
:syntax enable

set nu
hi LineNr ctermfg=grey
hi Comment cterm=italic gui=italic ctermfg=grey
hi String ctermfg=green
hi Statement ctermfg=magenta
hi Function ctermfg=blue
hi StatusLine ctermbg=none cterm=bold

set cursorline
highlight clear CursorLine
hi CursorLineNr ctermfg=white cterm=bold

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'

Plug '/usr/bin/fzf'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

":map Ctrl-P :FZF

":inoremap <F1> <C-P>

:nmap <C-P> :FZF<Enter>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-\> :vsp<Enter>
nnoremap <C-i> <C-W><C-W> 

