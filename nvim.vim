" -----------------------------------------------------------
" Configure specifically for vanilla NeoVIM
" -----------------------------------------------------------

" Configure j/k to move over visual line
" nnoremap <expr> j v:count ? 'j' : 'gj'
" nnoremap <expr> k v:count ? 'k' : 'gk'

" Select window by number
nnoremap <C-w>1 1<C-w>w
nnoremap <C-w>2 2<C-w>w
nnoremap <C-w>3 3<C-w>w
nnoremap <C-w>4 4<C-w>w
nnoremap <C-w>5 5<C-w>w
nnoremap <C-w>6 6<C-w>w
nnoremap <C-w>7 7<C-w>w
nnoremap <C-w>8 8<C-w>w
nnoremap <C-w>9 9<C-w>w

" " Cursor shape
" set guicursor=n-v:block,i-c-ci-ve:ver20,r-cr:hor15,o:hor50

" Blinking cursor
set guicursor=n-v:block,i-c-ci-ve:ver20,r-cr:hor15,o:hor50
    \,a:blinkwait700-blinkoff600-blinkon350
    \,sm:block-blinkwait190-blinkoff175-blinkon190

" NeoVim title
set title
set titlestring=Nvim\ -\ %F%h%m%r%w

" Auto write modified buffers
set autowriteall

