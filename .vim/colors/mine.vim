" Vim color file

" --- 色定義の分類 ---
"
" ## 赤・ピンク・マゼンタ系
"   - `#ED376D` : 鮮やかな赤紫
"   - `#960050` : 暗い赤紫
"   - `#F92672` : 鮮やかなマゼンタ
"   - `#EB597D` : 明るいピンク
"   - `#B56A7E` : くすんだピンク
"   - `#A8405A` : 暗い赤茶
"   - `#DEADB9` : 淡いピンクベージュ
"   - `#E32753` : 濃い赤
"   - `#CF7AB9` : 明るい紫がかったピンク
"   - `#F573A7` : 鮮やかなピンク
"   - `#D75A75` : くすんだ赤ピンク
"   - `#BA6E81` : 赤みがかったグレー
"
" ## オレンジ・イエロー・ブラウン系
"   - `#D69A56` : くすんだオレンジ
"   - `#C4BE89` : 明るい黄土色
"   - `#E8A860` : 明るいオレンジ
"   - `#463A2C` : 暗い茶色
"   - `#4F453A` : 暗い黄土色
"   - `#8C8075` : くすんだ茶色
"   - `#322B25` : 暗い茶色
"   - `#2A221A` : 非常に暗い茶色
"   - `#2C241C` : 非常に暗い茶色
"   - `#201C17` : 非常に暗い茶色
"   - `#F57C00` : 濃いオレンジ
"   - `#FB8C00` : 明るいオレンジ
"   - `#FF9800` : 鮮やかなオレンジ
"   - `#d7b077` : 淡い黄土色
"   - `#c4a476` : くすんだ黄土色
"   - `#908577` : くすんだ緑がかった茶色
"
" ## 青・シアン系
"   - `#66D9EF` : 鮮やかなシアン
"   - `#13354A` : 暗い青緑
"   - `#7070F0` : 明るい青
"
" ## 紫系
"   - `#AE81FF` : 明るい紫
"   - `#B48CE6` : くすんだ紫
"   - `#8C6379` : くすんだ赤紫
"
" ## 緑系
"   - `#A6E22E` : 鮮やかな黄緑
"   - `#70F0F0` : 明るいシアンがかった緑
"
" ## グレー・白・黒系
"   - `#909090` : 中程度のグレー
"   - `#8F8F8F` : 中程度のグレー
"   - `#89807D` : くすんだグレー
"   - `#4C4745` : 暗いグレー
"   - `#1E0010` : 非常に暗い赤みがかった黒
"   - `#999999` : 明るいグレー
"   - `#131313` : 非常に暗いグレー
"   - `#232526` : 暗いグレー
"   - `#BCA3A3` : 淡いグレー
"   - `#465457` : 暗い青みがかったグレー
"   - `#000000` : 黒
"   - `#808080` : 中程度のグレー
"   - `#B0B0B0` : 明るいグレー
"   - `#2e2823` : 暗い茶色がかったグレー
"   - `#342e28` : 暗い茶色がかったグレー
"   - `#413933` : 暗い茶色がかったグレー
"   - `#F0F0C0` : 淡い黄土色
"   - `#FF0000` : 赤
"   - `#FFFFFF` : 白
"   - `#606060` : 暗いグレー
"   - `#555555` : 中程度のグレー
"   - `#101010` : 非常に暗いグレー
"   - `#222222` : 暗いグレー
"   - `#C0C0C0` : 明るいグレー
"   - `#403D3D` : 暗いグレー
"   - `#696969` : 中程度のグレー
"   - `#202020` : 非常に暗いグレー
"   - `#333333` : 暗いグレー
"   - `#080808` : 非常に暗いグレー
" --- 色定義の分類 終わり ---

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="mine"

""
""
" 基本ハイライトグループ
"
hi Normal          guifg=#C0C0C0 guibg=#2A221A
hi Comment         guifg=#696969
hi NonText         guifg=#202020
hi SpecialKey      guifg=#202020

""
" 構文要素
"
hi Boolean         guifg=#AE81FF
hi Character       guifg=#D69A56
hi Number          guifg=#B48CE6
hi String          guifg=#909090
hi Conditional     guifg=#ED376D               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF
hi Delimiter       guifg=#8F8F8F
hi Float           guifg=#AE81FF
hi Function        guifg=#EB597D
hi Identifier      guifg=#F598BD
hi Keyword         guifg=#F92672               gui=bold
hi Label           guifg=#B56A7E               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi Operator        guifg=#F92672
hi PreCondit       guifg=#8C6379               gui=bold
hi PreProc         guifg=#8C6379
hi Question        guifg=#66D9EF
hi Repeat          guifg=#E32753               gui=bold
hi Statement       guifg=#606060               gui=none " html tag
hi StorageClass    guifg=#BA6E81               gui=none
hi Structure       guifg=#66D9EF
hi Tag             guifg=#F92672               gui=italic
hi Typedef         guifg=#66D9EF
hi Type            guifg=#F573A7               gui=none

""
" UI要素
"
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#000000
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000
hi MatchParen      guifg=#F0F0C0 guibg=#A8405A gui=bold
hi ModeMsg         guifg=#DEADB9 gui=none
hi MoreMsg         guifg=#EB597D
hi Search          guifg=#E8A860 guibg=#463A2C
hi SignColumn      guifg=#A6E22E guibg=#232526
hi SpecialChar     guifg=#F92672              gui=bold
hi SpecialComment  guifg=#465457               gui=bold
hi Special         guifg=#CF7AB9
hi SpecialKey      guifg=#66D9EF               gui=italic
hi Title           guifg=#C0C0C0               gui=bold
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold
hi Underlined      guifg=#808080               gui=underline
hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#4F453A
hi WildMenu        guifg=#66D9EF guibg=#000000

""
" 差分表示 (Diff)
"
hi DiffAdd                       guibg=#13354A ctermbg=151
hi DiffChange      guifg=#89807D guibg=#4C4745 ctermfg=247 ctermbg=238
hi DiffDelete      guifg=#960050 guibg=#1E0010 ctermfg=161 ctermbg=217
hi DiffText                      guibg=#4C4745 gui=italic,bold ctermbg=238 cterm=italic,bold

""
" エラー・メッセージ
"
hi Error           guifg=#960050 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E               gui=bold
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold

""
" 補完メニュー (Pmenu)
"
hi Pmenu           guifg=#B0B0B0 guibg=#2e2823
hi PmenuSel        guifg=#E8A860 guibg=#463A2C
hi PmenuSbar                     guibg=#342e28
hi PmenuThumb                    guibg=#413933

""
" スペルチェック
"
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif

""
" ステータスライン
"
hi StatusLine      guifg=#555555 guibg=#101010 gui=none
hi StatusLineNC    guifg=#222222 guibg=#101010 gui=none

""
" カーソル・行番号・カラム
"
hi Cursor          guifg=#333333 guibg=#8C8075
hi CursorLine      cterm=NONE guifg=NONE    guibg=#322B25 gui=none
hi CursorColumn                  guibg=#2A2722
hi ColorColumn                   guibg=#2C241C
hi LineNr          guifg=#505050 guibg=#201C17
hi CursorLineNr    guifg=#6F6F6F guibg=#362F27

""
" ファイル・ディレクトリ
"
hi Directory       guifg=#999999 guibg=#131313

""
" Frontmatter
"
hi yamlKey guifg=#66D9EF

""
" Markdown
"
hi markdownBold guifg=#D75A75 gui=bold cterm=bold
hi markdownCode guifg=#908577
hi markdownCodeBlock guifg=#908577
hi markdownListMarker guifg=#D69A56 gui=bold

" Markdown Headings
hi markdownH1 guifg=#F57C00 gui=bold
hi markdownH2 guifg=#FB8C00 gui=bold
hi markdownH3 guifg=#FF9800 gui=bold
hi markdownH4 guifg=#d7b077 gui=bold
hi markdownH5 guifg=#c4a476 gui=bold
hi markdownH6 guifg=#c4a476 gui=bold

" Markdown内のパスやURLに下線を引く
syn match markdownPathUrl "\v(\w+://|file:///|/)[^ \t\n\r]*(\.\w+)?(/[^ \t\n\r]*)?" contains=markdownUrlDelimiter
hi link markdownPathUrl Underlined
