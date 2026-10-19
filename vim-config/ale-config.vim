let g:ale_fix_on_save = 1

" Map languages to their respective global formatters
let g:ale_fixers = {
			\	 '*': ['remove_trailing_lines', 'trim_whitespace'],	
			\   'javascript': ['prettier'],
			\   'json': ['prettier'],
			\   'python': ['black'],
			\}
