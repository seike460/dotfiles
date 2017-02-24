# ls
alias ls='ls -GF'
alias l='ls -ltr'
alias ll='ls -lt'

# My Dirs
alias cdvar='cd ~/var'
alias code='cd ~/var/code/$(ls ~/var/code/ | peco)'
alias cdev='cd ~/var/dev'
alias cdocker='cd ~/var/Dockerfiles/$(ls ~/var/Dockerfiles/ | peco)'
alias cdvagrant='cd ~/var/Vagrantfiles'

# docker Command
alias d='docker'
alias de='docker exec -it $(d ps | peco | cut -d " " -f 1) /bin/bash'
alias dc='docker-compose' # sorry ex-dc...
alias dc_build_up='docker-compose rm -fv && docker-compose build && docker-compose up'
alias rm_docker_images='docker images -qf dangling=true | xargs docker rmi'
alias rm_docker_containers='docker ps -aqf status=exited | xargs docker rm -v' # rm with volumes
alias rm_docker_volumes='docker volume ls -qf dangling=true | xargs docker volume rm'
alias rm_docker_compose_containers='docker-compose rm -fv'

#github
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

if [ $SHLVL = 1 ]; then
	tmux
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

complete-ssh-host() {
    local host="$(command egrep -i '^Host\s+.+' $HOME/.ssh/config $(find $HOME/.ssh/conf.d -type f 2>/dev/null) | command egrep -v '[*?]' | awk '{print $2}' | sort | peco)"
    if [ ! -z "$host" ]; then
        LBUFFER+="$host"
    fi
    zle reset-prompt
}
zle -N complete-ssh-host
bindkey '^s^s' complete-ssh-host
