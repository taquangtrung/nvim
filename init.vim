" ------------------------------------------------
" General configurations

" Use global clipboard by default
set clipboard=unnamedplus

" Which wrap to allow l, h, ... move to next/previous lines
set whichwrap=l,h,<,>,[,]

" Use smart case for search
set ignorecase smartcase

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" -----------------------------------------------------------
" Load VimScript configuration
let vim_root_dir = expand('<sfile>:p:h')

if exists('g:vscode')
  execute 'source ' . vim_root_dir . '/vscode.vim'
else
  execute 'source ' . vim_root_dir . '/nvim.vim'
endif

" -----------------------------------------------------------
" Load Lua configuration
lua require('init')
