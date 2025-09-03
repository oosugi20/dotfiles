let g:imgcat_command = '~/.dotfiles/.zsh/.iTerm2/imgcat'

command! -nargs=1 Imgcat execute '!' . g:imgcat_command . ' ' . shellescape(expand(<f-args>))
