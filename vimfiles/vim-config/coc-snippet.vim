" Ctrl+j in insert mode expands a snippet or jumps to the next placeholder
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Ctrl+j in visual mode selects text as a snippet placeholder
vmap <C-j> <Plug>(coc-snippets-select)

" Ctrl+j jumps to the next placeholder
let g:coc_snippet_next = '<c-j>'

" Ctrl+k jumps to the previous placeholder
let g:coc_snippet_prev = '<c-k>'

" Tab navigates completion menu, inserts tab, or triggers completion
function! CheckBackSpace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1) :
			\ CheckBackSpace() ? "\<TAB>" :
			\ coc#refresh()
