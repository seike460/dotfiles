

# ls
alias ls='ls -GF'
alias l='ls -ltr'
alias ll='ls -lt'

# My Dirs
alias cdocker='cd ~/var/Dockerfiles/$(ls ~/var/Dockerfiles/ | peco)'
alias v='cd ~/vagrant/$(ls ~/vagrant | peco)'

# docker Command
alias d='docker'
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'
alias dc='docker-compose' # sorry ex-dc...
alias dc_build_up='docker-compose rm -fv && docker-compose build && docker-compose up'
alias rm_docker_images='docker images -qf dangling=true | xargs docker rmi'
alias rm_docker_containers='docker ps -aqf status=exited | xargs docker rm -v' # rm with volumes
alias rm_docker_volumes='docker volume ls -qf dangling=true | xargs docker volume rm'
alias rm_docker_compose_containers='docker-compose.backup rm -fv'

# github
alias g='cd ~/.ghq/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias gitdiff='git difftool --tool=vimdiff --no-prompt'
alias gitlog='git log --graph'
alias git_co_allowempty='git commit --allow-empty'
function git(){hub "$@"} # zsh

# tmux
if [ $SHLVL = 1 ]; then
	tmux
fi

# local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export PATH=$PATH:~/bin
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

complete-ssh-host() {
    local host="$(command egrep -i '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh/conf.d -type f 2>/dev/null) | command egrep -v '[*?]' | awk '{print $2}' | sort | peco)"
    if [ ! -z "$host" ]; then
        LBUFFER+="$host"
    fi
    zle reset-prompt
}
zle -N complete-ssh-host
bindkey '^s^s' complete-ssh-host

HISTSIZE=500000


function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

alias venv='source ~/.anyenv/envs/pyenv/venv/$(ls ~/.anyenv/envs/pyenv/venv/ | peco)/bin/activate'
