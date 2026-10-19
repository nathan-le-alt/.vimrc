nnoremap <silent> [g <Plug>(coc-diagnostics-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostics-next)
nnoremap <silent> \g :call ToggleDiagnostics()<CR>

function! ToggleDiagnostics() abort
	let winid = get(getloclist(0, {'winid': 0}), 'winid', 0)
	if winid != 0 && win_id2win(winid) != 0
		lclose
	else
		let diagnostics = CocAction('diagnosticList')
		if empty(diagnostics)
			echo 'no diagnostic found'
		else
			CocDiagnostics
		endif
	endif	
endfunction
