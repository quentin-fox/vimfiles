" highlighting

set nospell
source ~/.config/nvim/highlight.vim

let R_args_in_stline=0
let R_show_arg_help=0
let R_assign = 0
set completeopt-=preview
let g:pandoc#keyboard#use_default_mappings=0
let g:SuperTabCrMapping=1
let R_start_libs = 'base,stats,graphics,grDevices,utils,methods,tidyverse'

" indent options

set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=0 
set wrapmargin=0
set expandtab
set autoindent
set fileformat=unix
let r_indent_align_args = 0

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

inoremap  <Cmd>let @a=AssignInsert()<Cr><C-r>a

" nnoremap ;as {jI<Space><-<Space><Esc>0i
" inoremap ;as <Esc>{jI<Space><-<Space><Esc>0i

nnoremap ;sm }kA<Space>%>%<Space>summary()<Esc>

nmap <LocalLeader>rf <Plug>RStart <bar> :call ncm2#enable_for_buffer()<Cr>
nmap <LocalLeader>rq <Plug>RClose <bar> :call ncm2#disable_for_buffer()<Cr>

nnoremap <silent> ;as :call ToggleAssign()<Cr>

function! ToggleAssign()
  " b = search backwards, n = don't move cursor, c = accept match on line, W = no wrap
  let l:blank_ln = search('^\s\?$', 'bncW')
  let l:chunk_ln = search('```', 'bncW')
  let l:assign_ln = search('<-', 'bncW')
  if l:assign_ln > l:blank_ln 
    let l:oldstr = getline(l:assign_ln)
    let [l:current_ln, l:current_col] = getcurpos()[1:2]
    call setline(l:assign_ln, substitute(getline(l:assign_ln), '^.*<-\s\?', '', ''))
    let l:diffchar = len(l:oldstr) - len(getline(l:assign_ln))
    if l:assign_ln ==? l:current_ln
      call cursor(l:current_ln, (l:current_col - l:diffchar))
    endif
  elseif l:assign_ln < l:blank_ln
    if l:blank_ln > l:chunk_ln
      let l:newassign_ln = l:blank_ln + 1
    else
      let l:newassign_ln = l:chunk_ln + 1
    endif
    call setline(l:newassign_ln, ' <- ' . trim(getline(l:newassign_ln)))
    call cursor(l:newassign_ln, 1)
    startinsert
  endif
endfunction

" text object for chunk

"" a chunk
onoremap <silent> ac :<c-u>execute "normal ?^```{\rmc/^```\r:nohlsearch\rV`c"<Cr>
"" in chunk
onoremap <silent> ic :<c-u>execute "normal ?^```{\rjmc/^```\r:nohlsearch\rkV`c"<Cr>
"" chunk options (after first comma to the }
onoremap <silent> co :<c-u>execute "normal ?\\(^```{.*\\)\\@<=,.*\\(}\\)\\@=\r:nohlsearch\rgn"<Cr>
"" chunk name (from first { to the first comma
onoremap <silent> cn :<c-u>execute "normal ?\\(^```{r \\)\\@<=.*\\(,\\=.*}\\)\\@=\r:nohlsearch\rgn"<Cr>

