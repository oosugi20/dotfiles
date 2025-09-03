" ============================================================
" Keymap

" KeyRemap4MacBookで <C-h> <C-j> <C-k> <C-l> を矢印キーに割り当てたので、
" Normal / Visual Mode で割り当て直す。
nnoremap <Left> 5h
nnoremap <Right> 5l
nnoremap <Up> 5k
nnoremap <Down> 5j
vnoremap <Left> 5h
vnoremap <Right> 5l
vnoremap <Up> 5k
vnoremap <Down> 5j
"inoremap <Left> <C-h>
"inoremap <Right> <C-l>
"inoremap <Up> <C-j>
"inoremap <Down> <C-k>


" 折返し表示時も表示している行単位で移動するように
nnoremap j gj
nnoremap k gk

nnoremap r <C-r>

inoremap <C-f> <C-x><C-f>

inoremap <D-d> http://dummyimage.com/
nnoremap <D-d> ihttp://dummyimage.com/


nnoremap <Space> <C-e>
nnoremap <S-Space> <C-Y>

" paste
nnoremap <C-p> "0p
nnoremap <C-P> "0P
vnoremap <C-p> "0p
vnoremap <C-P> "0P

" scroll
nnoremap <Space>t zt
nnoremap <Space>m zz
nnoremap <Space>b zb

" カーソル下の単語をImgcatでプレビューするマッピング
" <leader>i で実行
" カーソル下の単語を画像パスとしてImgcatに渡す簡易的な実装。
" 画像パス自体にカーソルを合わせて実行することを想定しています。
nnoremap <leader>i :execute 'Imgcat ' . expand('<cfile>')<CR>

vnoremap <silent> <Space>hf <ESC>:HarfSize<CR>