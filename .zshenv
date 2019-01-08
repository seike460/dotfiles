# charset
export LANG=ja_JP.UTF-8

# autoload
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

# prompt
tmp_prompt="%{${fg[green]}%}[%~]%{${reset_color}%} %F{white} %D{%Y-%m-%d %H:%M:%S} %f
%{${fg[cyan]}%}%n%# %{${reset_color}%}"
#tmp_prompt="%{${fg[green]}%}[%~]%{${reset_color}%} %F{white} %f
#%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

if [ ${UID} -eq 0 ]; then
    tmp_prompt="%{${fg[green]}%}[%~]%{${reset_color}%} %F{white} %D{%Y-%m-%d %H:%M:%S} %f
%{${fg[ret]}%}%n%# %{${reset_color}%}"
    tmp_prompt2="%B%U${tmp_prompt2}%u%b"
    tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt
PROMPT2=$tmp_prompt2
SPROMPT=$tmp_sprompt

# Editor
export EDITOR=vim
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# ls command colors
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=1000000
export LISTMAX=50
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt extended_glob
setopt correct

# Do not add in root
if [[ $UID == 0 ]]; then
    unset HISTFILE
    export SAVEHIST=0
fi

# Key bindをemacsmode
bindkey -e

export PHP_BUILD_EXTRA_MAKE_ARGUMENTS=-j8
