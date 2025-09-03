"!
" itchyny/lightline.vim
"

""
" Power line fonts
"
" U+E0A0 
" U+E0A1 
" U+E0A2 
" U+E0B0 
" U+E0B1 
" U+E0B2 
" U+E0B3 


"      \ 'colorscheme': 'jellybeans',
let g:lightline = {
      \ 'colorscheme': 'custom_lightline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }
let g:lightline#colorscheme#custom_lightline#palette = {
      \ 'normal': {
      \   'left':   [ [ '#2A221A', '#9E9275', 234, 101 ], [ '#C0C0C0', '#32291E', 250, 237 ] ],
      \   'middle': [ [ '#C0C0C0', '#1F1812', 250, 234 ] ],
      \   'right':  [ [ '#2A221A', '#9E9275', 234, 101 ], [ '#2A221A', '#5C5342', 234, 101 ] ]
      \ },
      \ 'command': {
      \   'left':   [ [ '#2A221A', '#884D82', 234, 96 ],[ '#C0C0C0', '#32291E', 250, 237 ] ],
      \   'middle': [ [ '#C0C0C0', '#2A221A', 250, 234 ] ],
      \   'right':  [ [ '#2A221A', '#884D82', 234, 96 ], [ '#2A221A', '#5C5342', 234, 101 ] ]
      \ },
      \ 'insert': {
      \   'left':   [ [ '#2A221A', '#E5A84C', 234, 186 ], [ '#C0C0C0', '#32291E', 250, 237 ] ],
      \   'middle': [ [ '#C0C0C0', '#2A221A', 250, 234 ] ],
      \   'right':  [ [ '#2A221A', '#E5A84C', 234, 186 ], [ '#2A221A', '#5C5342', 234, 101 ] ]
      \ },
      \ 'visual': {
      \   'left':   [ [ '#2A221A', '#B56A6A', 234, 131 ], [ '#C0C0C0', '#32291E', 250, 237 ] ],
      \   'middle': [ [ '#C0C0C0', '#2A221A', 250, 234 ] ],
      \   'right':  [ [ '#2A221A', '#B56A6A', 234, 131 ], [ '#2A221A', '#5C5342', 234, 101 ] ]
      \ },
      \ 'replace': {
      \   'left':   [ [ '#2A221A', '#D16464', 234, 167 ], [ '#C0C0C0', '#32291E', 250, 237 ] ],
      \   'middle': [ [ '#C0C0C0', '#2A221A', 250, 234 ] ],
      \   'right':  [ [ '#2A221A', '#D16464', 234, 167 ], [ '#2A221A', '#5C5342', 234, 101 ] ]
      \ },
      \ 'inactive': {
      \   'left':   [ [ '#5A5140', '#2A221A', 241, 234 ] ],
      \   'middle': [ [ '#5A5140', '#241D17', 241, 234 ] ],
      \   'right':  [ [ '#5A5140', '#2A221A', 241, 234 ] ]
      \ }
      \ }

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction


function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction


function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction


function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction


"let g:airline#extensions#branch#enabled = 0
"let g:airline_theme = 'bubblegum'
"let g:airline_powerline_fonts = 1
