# ls
alias ls='ls -GF'
alias l='ls -ltr'
alias ll='ls -lt'

# My Dirs
alias cdvar='cd ~/var'
alias cdev='cd ~/var/dev'
alias cdocker='cd ~/var/Dockerfiles'
alias cdvagrant='cd ~/var/Vagrantfiles'

# docker Command
alias d='docker'
alias dc='docker-compose' # sorry ex-dc...
alias dc_build_up='docker-compose rm -fv && docker-compose build && docker-compose up'
alias rm_docker_images='docker images -qf dangling=true | xargs docker rmi'
alias rm_docker_containers='docker ps -aqf status=exited | xargs docker rm -v' # rm with volumes
alias rm_docker_volumes='docker volume ls -qf dangling=true | xargs docker volume rm'
alias rm_docker_compose_containers='docker-compose rm -fv'

if [ $SHLVL = 1 ]; then
	tmux
fi
