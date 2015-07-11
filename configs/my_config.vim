set nu
set ts=4
set expandtab
set autoindent
set clipboard += unnamed
set nopaste 

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" " happens in VIM UI)
"  
function! WrapForTmux(s)
  if !exists('$TMUX')
     return a:s
  endif
         
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
                
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
                   
let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")
                   
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
 
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

Plugin 'fatih/vim-go'
Plugin 'gmarik/vundle'

