" spelling options

highlight SpellBad cterm=underline ctermfg=Red guifg=Red ctermbg=NONE guibg=NONE
highlight SpellCap cterm=undercurl ctermfg=81 gui=undercurl guifg=81 guisp=LightBlue

" pandoc options

let g:pandoc#command#use_message_buffer=0

" markdown stuff

" align tables every time I type '|'
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

let g:pandoc#modules#disabled=["folding"]
let g:vim_markdown_math = 1
let g:tex_conceal=""
let g:vim_markdown_new_list_item_indent = 2
let g:pandoc#command_use_message_buffers=0

" mappings

nnoremap ;vw :w<Cr>:Pandoc! pdf --filter pandoc-eqnos --pdf-engine=xelatex<Cr>
inoremap ;dm <Enter><Enter>$$  $$ {#eq:}<Enter><Enter><++><Esc>B2k3li
inoremap ;im $$<++><Esc>4hi
inoremap // \frac{}{<++>}<++><Esc>10hi
inoremap ø <C-d>
inoremap π <C-t>
setlocal tabstop=4
setlocal shiftwidth=4 
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
inoremap ;bf ****<++><Esc>5hi
inoremap ;it **<++><Esc>4hi

