" Toggle NERDTree open/closed with Ctrl+n
nnoremap <silent> <C-\> :NERDTreeToggle<CR>

" Reveal the currently active file in the sidebar tree with Ctrl+f
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window left open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
