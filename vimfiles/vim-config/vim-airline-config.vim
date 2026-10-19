" Set 256 colors and statusline visibility first
set laststatus=2
set t_Co=256

" Enable Powerline fonts
let g:airline_powerline_fonts = 1

" Powerline separators (Powerline glyphs)
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'

" Symbols setup
let g:airline_symbols = get(g:, 'airline_symbols', {})
let g:airline_symbols.branch = '' " Options: '', 'git:', or ''
let g:airline_symbols.modified = ' [+] '

" Theme
" let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
" If you don't like many colors and prefer the conservative style of the standard Visual Studio
" let g:codedark_conservative=1
" If you like the new dark modern colors (Needs feedback!)
let g:codedark_modern=1
" Activates italicized comments (make sure your terminal supports italics)
let g:codedark_italics=1
" Make the background transparent
" let g:codedark_transparent=1
let g:airline_theme = 'codedark'

" Tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t' " show only file name, not full path
let g:airline#extensions#tabline#vcs_config_text = 1
let g:airline#extensions#tabline#show_mod_after = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0

" Git & Hunks customization
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)} %{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}'

" Extensions & Linter integration
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#lsp#enabled = 0
let g:airline#extensions#whitespace#enabled = 1

" Custom icon function for Section C
function! AirlineSectionCWithIcon()
  let l:path = expand('%:t') " Use :t for tail/filename, or %:p:~ for full relative path

  if empty(l:path)
    return '[No Name]'
  endif

  if &modified
    let l:path .= ' [+]'
  endif

  let l:icon = ''
  if has('nvim') && luaeval('pcall(require, "nvim-web-devicons")')
    let l:ext = expand('%:e')
    let l:icon = luaeval('require("nvim-web-devicons").get_icon(_A, _A, {default = true})', [expand('%:t'), l:ext])
  elseif exists('*WebDevIconsGetFileTypeSymbol')
    let l:icon = WebDevIconsGetFileTypeSymbol()
  endif

  if !empty(l:icon)
    return l:icon . ' ' . l:path
  endif

  return l:path
endfunction

let g:airline_section_c = '%{AirlineSectionCWithIcon()}'

" Disable bold mode on sections
function! s:update_airline_fonts()
  highlight airline_x cterm=NONE gui=NONE
  highlight airline_y cterm=NONE gui=NONE
  highlight airline_z cterm=NONE gui=NONE

  highlight airline_a cterm=NONE gui=NONE
  highlight airline_a_bold cterm=NONE gui=NONE
  highlight airline_a_normal cterm=NONE gui=NONE
  highlight airline_a_insert cterm=NONE gui=NONE
  highlight airline_a_visual cterm=NONE gui=NONE
  highlight airline_a_replace cterm=NONE gui=NONE
  highlight airline_a_commandline cterm=NONE gui=NONE
endfunction

augroup FixAirlineBold
  autocmd!
  autocmd User AirlineAfterInit call s:update_airline_fonts()
  autocmd User AirlineModeChanged call s:update_airline_fonts()
augroup END

