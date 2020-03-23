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
