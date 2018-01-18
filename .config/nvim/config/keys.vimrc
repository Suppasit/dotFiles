" Function keys
nnoremap <silent> <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F4> :source $HOME/.config/nvim/init.vim<CR>
nnoremap <F5> :TagbarToggle<CR>
nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :UndotreeToggle<CR>
nnoremap <F8> :Geeknote<CR>
" indent whole file according to syntax rules
noremap <F9> gg=G

" Map <leader>
:let mapleader = ";"

" Switch between buffers
nmap <leader>n :bn<cr>
nmap <leader>p :bp<cr>
nmap <leader>d :bd<cr>

" Handling vim-fswitch
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>


" toggle invisible characters
" set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>l :set list!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight words
"""""""""""""""""""""""""""""""""""""""""""""""""
" Existing match patterns for each highlight group.
let g:hi_interesting_word_patterns = ['', '', '', '', '', '', '']

function! HiInterestingWord(n)
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Attempting to highlight the same pattern will toggle the highlight.
    " Turning off a highlight for a word will turn it off for all
    " highlight groups.
    let toggled = 0
    for i in [1, 2, 3, 4, 5, 6]
      let existing_pat = get(g:hi_interesting_word_patterns, i, '')

      " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
      let mid = 86750 + i

      if pat ==? existing_pat
        " Clear existing matches, but don't worry if they don't exist.
        " This is toggle highlight off.
        silent! call matchdelete(mid)
        let g:hi_interesting_word_patterns[i] = ''

        if i == a:n
          let toggled = 1
        endif
      endif
    endfor

    " Current pattern didn't match any existing?  Move highlight to new word
    if toggled == 0
      let mid = 86750 + a:n
      silent! call matchdelete(mid)
      call matchadd("InterestingWord" . a:n, pat, 1, mid)
      let g:hi_interesting_word_patterns[a:n] = pat
    endif

    " Move back to our original location.
    normal! `z
endfunction

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" Easy navigation around splits.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
