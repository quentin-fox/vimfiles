let R_args_in_stline=0
let R_show_arg_help=0
inoremap  <Cmd>let @a=AssignInsert()<Cr><C-r>a
let R_assign = 0
set completeopt-=preview
let g:pandoc#keyboard#use_default_mappings=0
let g:SuperTabCrMapping=1
let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,tidyverse'

" make nvim-r console plain
let Rout_more_colors=0
let R_hl_term=0
let R_buffer_opts = "nonumber"

if has('nvim')
	autocmd TermOpen * setlocal nonumber norelativenumber
	autocmd BufEnter term://* setlocal nonumber norelativenumber
else
	autocmd TerminalOpen * setlocal nonumber
end

" disable autospace from autopairs

let g:AutoPairsMapSpace=0

" for option - as well-spaced <- in insert mode

function! AssignInsert()
	let l:uc = strpart(getline("."), col(".")-1, 1)
	let l:bc = strpart(getline("."), col(".")-2, 1)
	if l:uc == ' ' && l:bc == ' '
		return '<-'
	elseif l:uc != ' ' && l:bc == ' '
		return '<- '
	elseif l:uc == ' ' && l:bc != ' '
		return ' <-'
	elseif l:uc != ' ' && l:bc != ' '
		return ' <- '
	endif
endfunction

