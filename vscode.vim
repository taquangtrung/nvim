" -----------------------------------------------------------
" Configure specifically for VSCode-NeoVIM
" -----------------------------------------------------------

" Rebind leader key
let mapleader="\\"

" Disable matching parenthesis for VSCode
:let loaded_matchparen = 1

" Rebind some keys to move over visual line
nmap j gj
nmap k gk
nmap $ g$
nmap 0 g0

" Make sure `gj`, `gk` maintain the column
set ve=onemore

" " Highlight color of current searched text
" " Note: cannot be self-adjusted whent theme change
" if &background ==# 'dark'
"   highlight CurSearch gui=NONE guibg=#2257a0       " Work with dark theme
" else
"   highlight CurSearch gui=NONE guibg=#add5ff       " Work with light theme
" endif

" Get folding working with vscode neovim plugin
nnoremap zM :call VSCodeNotify('editor.foldAll')<CR>
nnoremap zR :call VSCodeNotify('editor.unfoldAll')<CR>
nnoremap zc :call VSCodeNotify('editor.fold')<CR>
nnoremap zC :call VSCodeNotify('editor.foldRecursively')<CR>
nnoremap zo :call VSCodeNotify('editor.unfold')<CR>
nnoremap zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
nnoremap za :call VSCodeNotify('editor.toggleFold')<CR>
function! MoveCursor(direction) abort
  if(reg_recording() == '' && reg_executing() == '')
    return 'g'.a:direction
  else
    return a:direction
  endif
endfunction
nmap <expr> j MoveCursor('j')
nmap <expr> k MoveCursor('k')

" Bind <C-i>, <C-o> to use NVIM jump list by default.
nnoremap <C-i> <C-i>
nnoremap <C-o> <C-o>

" Keep text selection after re-indent by <, >
vnoremap < <gv
vnoremap > >gv

" Wrapping VSCode commands to transform Neovim selection to VSCode selection
xnoremap <C-S-H> <Cmd>call VSCodeNotifyVisual('workbench.action.replaceInFiles', 0)<CR>


