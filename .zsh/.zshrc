export LANG=ja_JP.UTF-8
# 文字コード


# ビープ音ならなさない
setopt nobeep


test -e "${ZDOTDIR}/.iterm2_shell_integration.zsh" && source "${ZDOTDIR}/.iterm2_shell_integration.zsh"

# iTerm2でキー入力後のディレイをなくす
KEYTIMEOUT=0

source ~/.dotfiles/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# GEM
export GEM_HOME='/usr/local'

# JDK
export JAVA_HOME='/usr/libexec/java_home'

# Gemini CLI with GCP Billing
#####export GOOGLE_APPLICATION_CREDENTIALS=~/.gemini/gemini-cli-key.json
#####export GEMINI_BASE_URL=https://us-central1-aiplatform.googleapis.com
#####export GEMINI_MODEL=gemini-2.5-flash
#export GEMINI_MODEL="projects/gemini-sbx-oosugi20/locations/us-central1/publishers/google/models/gemini-2.5-flash"
#export GEMINI_MODEL="publishers/google/models/gemini-2.5-flash"
#export GOOGLE_GENAI_USE_VERTEXAI=true
#export GEMINI_MODEL=publishers/google/models/gemini-2.5-flash
#export GOOGLE_CLOUD_PROJECT=gemini-sbx-oosugi20
#export GOOGLE_CLOUD_LOCATION=us-central1
#export GOOGLE_GENAI_USE_VERTEXAI=true
#export GOOGLE_APPLICATION_CREDENTIALS=/Users/oosugi20/.gemini/gemini-cli-key.json
#  export GOOGLE_APPLICATION_CREDENTIALS="/Users/oosugi20/.gemini/gemini-cli-key.json"
#  export GEMINI_BASE_URL="https://us-central1-aiplatform.googleapis.com"
#  export GEMINI_MODEL="projects/gemini-sbx-oosugi20/locations/us-central1/publishers/google/models/gemini-2.5-flash"
#  export GOOGLE_CLOUD_PROJECT="gemini-sbx-oosugi20"
#  export GOOGLE_CLOUD_LOCATION="us-central1"
#  export GOOGLE_GENAI_USE_VERTEXAI="true"
#  export GOOGLE_API_KEY=""

##export EDITOR=mvim
##
### Git Editor
##export GIT_EDITOR='mvim -f'
#
#
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --reverse))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
# fd - cd to selected directory
#fd() {
#  local dir
#  dir=$(find ${1:-.} -path '*/\.*' -prune \
#                  -o -type d -print 2> /dev/null | fzf +m --reverse) &&
#  cd "$dir"
#}
# Another fd - cd into the selected directory
# This one differs from the above, by only showing the sub directories and not
#  showing the directories within those.
fd() {
  DIR=`find * -maxdepth 0 -type d -print 2> /dev/null | fzf-tmux --reverse` \
    && cd "$DIR"
}
# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m --reverse) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

source ~/.dotfiles/.zsh/.zshrc.path
source ~/.dotfiles/.zsh/.zshrc.prompt
source ~/.dotfiles/.zsh/.zshrc.alias
source ~/.dotfiles/.zsh/.zshrc.complement
source ~/.dotfiles/.zsh/.zshrc.dirs
source ~/.dotfiles/.zsh/.zshrc.history

# direnv hook
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



function fga() {
  local selected
  selected=$(unbuffer git status -s | fzf -m --ansi --reverse --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
  if [[ -n "$selected" ]]; then
    selected=$(tr '\n' ' ' <<< "$selected")
    git add $(echo ${selected% })
    echo "Completed: git add $selected"
  fi
}


# fzfでcd履歴
function chpwd() {
  powered_cd_add_log
}

function powered_cd_add_log() {
  local i=0
  cat ~/.powered_cd.log | while read line; do
    (( i++ ))
    if [ i = 30 ]; then
      sed -i -e "30,30d" ~/.powered_cd.log
    elif [ "$line" = "$PWD" ]; then
      sed -i -e "${i},${i}d" ~/.powered_cd.log
    fi
  done
  echo "$PWD" >> ~/.powered_cd.log
}

function powered_cd() {
  if [ $# = 0 ]; then
    cd $(gtac ~/.powered_cd.log | fzf --reverse)
  elif [ $# = 1 ]; then
    cd $1
  else
    echo "powered_cd: too many arguments"
  fi
}

_powered_cd() {
  _files -/
}

compdef _powered_cd powered_cd

[ -e ~/.powered_cd.log ] || touch ~/.powered_cd.log
