" =========================
" Base editor behavior
" =========================

syntax on
set background=dark
set termguicolors

" Show absolute line numbers
set number

" UI noise: mode is shown by airline, not by Vim itself
set noshowmode

" Show partially typed commands like d2w, c$, etc
set showcmd

" Disable the built-in ruler because airline shows cursor position
set noruler

" Shorter completion / command messages
set shortmess+=c

" Enable mouse support inside Vim
set mouse=a

" Use system clipboard when available
set clipboard=unnamedplus


" =========================
" Core highlight reset
" =========================

if exists("syntax_on")
  syntax reset
endif

hi clear


" =========================
" UI colors
" Mountain Home inspired palette
" =========================

highlight Normal         guifg=#f0f0f0 guibg=#0f0f0f ctermfg=15 ctermbg=0
highlight CursorColumn   guibg=#1a1a1a ctermbg=8
highlight Visual         guifg=NONE    guibg=#262626 cterm=NONE ctermbg=8
highlight LineNr         guifg=#4c4c4c guibg=#0f0f0f ctermfg=8  ctermbg=0
highlight CursorLineNr   guifg=#c4c19e guibg=#0f0f0f ctermfg=11 ctermbg=0
highlight VertSplit      guifg=#262626 guibg=#0f0f0f ctermfg=8  ctermbg=0
highlight StatusLine     guifg=#f0f0f0 guibg=#262626 ctermfg=15 ctermbg=8
highlight StatusLineNC   guifg=#4c4c4c guibg=#262626 ctermfg=8  ctermbg=8
highlight Pmenu          guifg=#f0f0f0 guibg=#262626 ctermfg=15 ctermbg=8
highlight PmenuSel       guifg=#0f0f0f guibg=#8aac8b ctermfg=0  ctermbg=10
highlight Search         guifg=#0f0f0f guibg=#c4c19e ctermfg=0  ctermbg=11
highlight IncSearch      guifg=#0f0f0f guibg=#c49ea0 ctermfg=0  ctermbg=9
highlight MatchParen     guifg=#f0f0f0 guibg=#4c4c4c ctermfg=15 ctermbg=8
highlight EndOfBuffer    guifg=#0f0f0f guibg=#0f0f0f ctermfg=0  ctermbg=0


" =========================
" Syntax colors
" Kept muted to match the rest of the setup
" =========================

highlight Comment        guifg=#7a7a7a ctermfg=8
highlight Constant       guifg=#c4c19e ctermfg=11
highlight String         guifg=#ac8a8c ctermfg=9
highlight Character      guifg=#ac8a8c ctermfg=9
highlight Number         guifg=#c4c19e ctermfg=11
highlight Boolean        guifg=#c4c19e ctermfg=11
highlight Float          guifg=#c4c19e ctermfg=11

highlight Identifier     guifg=#e7e7e7 ctermfg=15
highlight Function       guifg=#8aac8b ctermfg=10

highlight Statement      guifg=#8aac8b ctermfg=10
highlight Conditional    guifg=#8aac8b ctermfg=10
highlight Repeat         guifg=#8aac8b ctermfg=10
highlight Label          guifg=#8aac8b ctermfg=10
highlight Operator       guifg=#e7e7e7 ctermfg=15
highlight Keyword        guifg=#8aac8b ctermfg=10
highlight Exception      guifg=#c49ea0 ctermfg=9

highlight PreProc        guifg=#c4c19e ctermfg=11
highlight Include        guifg=#8aac8b ctermfg=10
highlight Define         guifg=#8aac8b ctermfg=10
highlight Macro          guifg=#c4c19e ctermfg=11
highlight PreCondit      guifg=#c4c19e ctermfg=11

highlight Type           guifg=#e7e7e7 ctermfg=15
highlight StorageClass   guifg=#c49ea0 ctermfg=9
highlight Structure      guifg=#e7e7e7 ctermfg=15
highlight Typedef        guifg=#e7e7e7 ctermfg=15

highlight Special        guifg=#c4c19e ctermfg=11
highlight SpecialChar    guifg=#c4c19e ctermfg=11
highlight Tag            guifg=#8aac8b ctermfg=10
highlight Delimiter      guifg=#e7e7e7 ctermfg=15
highlight SpecialComment guifg=#7a7a7a ctermfg=8
highlight Debug          guifg=#c49ea0 ctermfg=9

highlight Underlined     guifg=#e7e7e7 ctermfg=15
highlight Error          guifg=#c49ea0 guibg=#0f0f0f ctermfg=9 ctermbg=0
highlight Todo           guifg=#0f0f0f guibg=#d0c89a ctermfg=0 ctermbg=11

" Generic fallback groups used by some filetypes/plugins
highlight Title          guifg=#8aac8b ctermfg=10
highlight Directory      guifg=#c4c19e ctermfg=11


" =========================
" Filetype-specific TOML tweaks
" These help keep section headers and special tokens muted
" =========================

augroup TomlFix
  autocmd!
  autocmd FileType toml highlight Title      guifg=#8aac8b ctermfg=10
  autocmd FileType toml highlight Directory  guifg=#c4c19e ctermfg=11
  autocmd FileType toml highlight Special    guifg=#c4c19e ctermfg=11
  autocmd FileType toml highlight Identifier guifg=#e7e7e7 ctermfg=15
augroup END


" =========================
" vim-airline
" Minimal Mountain Home themed statusline
" =========================

let g:airline_powerline_fonts = 0
let g:airline_skip_empty_sections = 1
let g:airline_exclude_preview = 1

" Keep airline compact
let g:airline_section_a = ' %{mode()} '
let g:airline_section_b = ' %F '
let g:airline_section_c = ' %{airline#extensions#branch#get_head()!=#"" ? " ".airline#extensions#branch#get_head() : ""} %{&filetype} '
let g:airline_section_x = ''
let g:airline_section_y = ' %p%% '
let g:airline_section_z = ' %l:%c '

" Remove warning/error side segments and disable noisy extensions
let g:airline_section_warning = ''
let g:airline_section_error = ''

let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'y', 'z' ]
      \ ]

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#quickfix#enabled = 0

function! AirlineThemeMountainHome()
  let g:airline#themes#mountainhome#palette = {}

  let s:bg     = '#0f0f0f'
  let s:bg_alt = '#262626'
  let s:bg_dim = '#1a1a1a'
  let s:fg     = '#f0f0f0'
  let s:fg_dim = '#c4c19e'
  let s:green  = '#8aac8b'
  let s:red    = '#ac8a8c'
  let s:yellow = '#c4c19e'
  let s:white  = '#e7e7e7'

  let g:airline#themes#mountainhome#palette.normal =
        \ airline#themes#generate_color_map(
        \ [s:green,  s:bg_alt, 10, 8],
        \ [s:fg,     s:bg_alt, 15, 8],
        \ [s:fg_dim, s:bg_dim, 11, 0])

  let g:airline#themes#mountainhome#palette.insert =
        \ airline#themes#generate_color_map(
        \ [s:yellow, s:bg_alt, 11, 8],
        \ [s:fg,     s:bg_alt, 15, 8],
        \ [s:fg_dim, s:bg_dim, 11, 0])

  let g:airline#themes#mountainhome#palette.visual =
        \ airline#themes#generate_color_map(
        \ [s:white,  s:bg_alt, 15, 8],
        \ [s:fg,     s:bg_alt, 15, 8],
        \ [s:fg_dim, s:bg_dim, 11, 0])

  let g:airline#themes#mountainhome#palette.replace =
        \ airline#themes#generate_color_map(
        \ [s:red,    s:bg_alt, 9, 8],
        \ [s:fg,     s:bg_alt, 15, 8],
        \ [s:fg_dim, s:bg_dim, 11, 0])

  let g:airline#themes#mountainhome#palette.inactive =
        \ airline#themes#generate_color_map(
        \ [s:fg_dim, s:bg_dim, 11, 0],
        \ [s:fg_dim, s:bg_dim, 11, 0],
        \ [s:fg_dim, s:bg_dim, 11, 0])

  " Prevent aggressive truncation of sections
  let g:airline#extensions#default#section_truncate_width = {
        \ 'a': 999,
        \ 'b': 999,
        \ 'c': 999,
        \ 'x': 999,
        \ 'y': 999,
        \ 'z': 999,
        \ }

  let g:airline_theme = 'mountainhome'
endfunction

augroup AirlineMountainHome
  autocmd!
  autocmd VimEnter * call AirlineThemeMountainHome() | AirlineRefresh
augroup END

" Apply theme immediately when re-sourcing ~/.vimrc
if exists(':AirlineRefresh')
  call AirlineThemeMountainHome()
  let g:airline_theme = 'mountainhome'
  AirlineRefresh
endif
