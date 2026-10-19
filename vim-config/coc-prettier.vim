xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

function! s:coc_format_on_save()
  if CocHasProvider('format')
    call CocActionAsync('format')
  endif
endfunction

augroup coc_format
  autocmd!
  autocmd BufWritePre  *.js,*.jsx,*.ts,*.tsx,*.json,*.css,*.md,*.py call s:coc_format_on_save()
augroup END
