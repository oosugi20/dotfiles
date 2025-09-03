"!
" Vundle
"
" https://github.com/VundleVim/Vundle.vim
"

set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'



""
" My Plugins
"

" Library
Plugin 'L9'

" Explore
Plugin 'FuzzyFinder' " need L9
"Plugin 'oosugi20/outline.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'rking/ag.vim'
"Plugin 'github/copilot.vim'

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)


" Support editing
Plugin 'tpope/vim-surround'
"Plugin 'Align'
Plugin 'matchit.zip'
"Plugin 'heavenshell/vim-jsdoc'
"Plugin 'oosugi20/vim-pickcssselector'
Plugin 'thinca/vim-qfreplace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier'
Plugin 'w0rp/ale'
Plugin 'findango/mdxdotvim'

" Syntax hilighting & filetype
"Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'wuelnerdotexe/vim-astro'
"Plugin 'skammer/vim-css-color'
"Plugin 'mustache/vim-mustache-handlebars'
"Plugin 'posva/vim-vue'
""Plugin 'kchmck/vim-coffee-script'
""Plugin 'digitaltoad/vim-jade'
""Plugin 'digitaltoad/vim-pug'
""Plugin 'wavded/vim-stylus'
Plugin 'lepture/vim-jinja'

"Plugin 'tell-k/vim-browsereload-mac'

" Expand view
Plugin 'itchyny/lightline.vim'

" Git
Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'


"Bundle 'hokaccha/vim-html5validator'
"Bundle 'cocopon/colorswatch.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
