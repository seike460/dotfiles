# ls
alias ls='ls -GF'
alias l='ls -ltr'
alias ll='ls -lt'

# docker Command
alias dp='docker ps'
alias de='docker exec -it -e COLUMNS=250 -e LINES=50 -e TERM=xterm $(docker ps | peco | cut -d " " -f 1) /bin/bash'
alias dc='docker-compose' # sorry ex-dc...
alias dc_build_up='docker-compose rm -fv && docker-compose build && docker-compose up'

alias rm_docker_images='docker images -qf dangling=true | xargs docker rmi'
alias rm_docker_containers='docker ps -aqf status=exited | xargs docker rm -v' # rm with volumes
alias rm_docker_volumes='docker volume ls -qf dangling=true | xargs docker volume rm'
alias rm_docker_compose_containers='docker-compose.backup rm -fv'

# docker container command
alias dpg='pgcli -U postgres -h localhost'

# github
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias gitdiff='git difftool --tool=vimdiff --no-prompt'
alias gitlog='git log --graph'
alias ga='git commit --allow-empty'
alias gb='git branch'
alias gc='git checkout'
alias gs='git status'
alias gdv='vim $(git status -s | awk '"'"'{print $2}'"'"' | peco)'

function git(){hub "$@"} # zsh

# tmux
if [ $SHLVL = 1 ]; then
    tmux
fi
if [ $TMUX_PANE = 2 ]; then
    tmux split-window -v -p 10
fi

complete-ssh-host() {
    local host="$(command egrep -i '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh/conf.d -type f 2>/dev/null) | command egrep -v '[*?]' | awk '{print $2}' | sort | peco)"
    if [ ! -z "$host" ]; then
        LBUFFER+="$host"
    fi
    zle reset-prompt
}
zle -N complete-ssh-host
bindkey '^s^s' complete-ssh-host

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-tree-vim-igunore-vendor(){
    local SELECTED_FILE=$(find . -type f -not -path "./vendor/*" -not -path "./.*"| peco)
    if [ ! -z "$SELECTED_FILE" ]; then
        BUFFER="vim $SELECTED_FILE"
        zle accept-line
    fi
}

function peco-tree-vim(){
    local ALL_SELECTED_FILE=$(find . -type f | peco)
    if [ ! -z "$ALL_SELECTED_FILE=$" ]; then
        BUFFER="vim $ALL_SELECTED_FILE"
        zle accept-line
    fi
}

zle -N peco-tree-vim
bindkey "^v" peco-tree-vim

zle -N peco-tree-vim-igunore-vendor
bindkey "^p" peco-tree-vim-igunore-vendor

alias ja='trans ja:en'
alias en='trans en:ja'

alias sed='gsed'

setopt prompt_subst
setopt hist_ignore_all_dups
setopt share_history
setopt prompt_subst

# VCSの情報を取得するzsh関数
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
colors

zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

precmd () { vcs_info }

RPROMPT='${vcs_info_msg_0_}'

export PATH=$PATH:./node_modules/.bin
export PATH=$PATH:~/bin
export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH
export PATH="$HOME/.anyenv/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
eval "$(anyenv init -)"

# local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

HISTSIZE=500000
