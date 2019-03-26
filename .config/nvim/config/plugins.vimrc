filetype plugin indent on

" neomake config
"autocmd! BufWritePost * Neomake
" autocmd BufLeave * QFix

"let g:neomake_place_signs = 0

"let g:neomake_open_list = 2

"set background=dark
" colorscheme apprentice
set termguicolors
colorscheme base16-summerfruit-dark

" make background transparent
"hi Normal ctermbg=NONE
"hi EndOfBuffer ctermbg=NONE
"hi LineNr ctermbg=234

" CtrlP
let g:ctrlp_prompt_mappings={'PrtClearCache()':['<Leader><F5>']}
let g:ctrlp_prompt_mappings={'PrtdeleteEnt()':['<Leader><F7>']}
let g:ctrlp_match_window='bottom,order:btt,min:2,max:25'
set wildmenu " enhanced autocomplete
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*node_modules*,*.jpg,*.png,*.svg,*.ttf,*.woff,*.woff3,*.eot
",*public/css/*,*public/js*

" delimitMate options
let delimitMate_expand_cr=1

" enable matchit (for matching tags with %)
runtime macros/matchit.vim

" vim-sneak settings
hi SneakPluginTarget ctermfg=black ctermbg=181818

""""""""""""""""""""""""""""""""
" vim-ack plugin configuration
""""""""""""""""""""""""""""""""
" Change the the command to run to ack-grep on Debian/Ubuntu for ack.vim plugin.
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Search using Ack plugin.
nnoremap <leader>a :Ack<space>

" Search for current word under cursor.
nnoremap <leader>aw :Ack <cword><CR>

""""""""""""""""""""""""""""""""""""""""""""""
" FSwitch configuration
""""""""""""""""""""""""""""""""""""""""""""""
" Use FSwitch plugin to switch between source/header.
com! A :call FSwitch('%', '')

function! FSwitchSetVariables(dst, locs)
  if !exists("b:fswitchdst")
    let b:fswitchdst = a:dst
  endif
  if !exists("b:fswitchlocs")
    let b:fswitchlocs = a:locs
  endif
endfunction


"" Modify FSwitch grouping to switch cc/h files correctly.
" Expressions match against directory of source file.  For ifrel, if the source pattern matches
" then the replacement expression is appended to the path before glob expansion.
augroup custom_fswitch_au_group
  au!
   au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C'
   au BufEnter *.h let b:fswitchlocs = 'reg:|include|src|,reg:|include.*|src|,reg:|include/[^/]*|src|'

   au BufEnter *.c let b:fswitchdst  = 'h'
   au BufEnter *.c let b:fswitchlocs = 'ifrel:|/src/|../include/**|,reg:|src|include|,reg:|src|include/**|,ifrel:|/src/|../../include/**|'

   au BufEnter *.cpp let b:fswitchdst  = 'h'
   au BufEnter *.cpp let b:fswitchlocs = 'ifrel:|/src/|../include/**|,reg:|src|include|,reg:|src|include/**|,ifrel:|/src/|../../include/**|'
augroup END

" Don't have FSwitch automatically create new files if they don't already
" exist.
let g:fsnonewfiles = 1

" Show normal line number mode:'myusuf3/numbers.vim'
"au VimEnter * NumbersToggle
