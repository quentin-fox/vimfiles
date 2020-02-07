" spacing

set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0 " code won't automatically split
set wrapmargin=0
set wrap
set expandtab
set autoindent
set fileformat=unix

let g:neomake_javascript_eslint_exe = $PWD . '/node_modules/.bin/eslint'
