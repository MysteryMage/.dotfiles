function get_time_greeting() {
    local h=`date +%H`

    if [ $h -lt 12 ]; then
      echo good morning
    elif [ $h -lt 18 ]; then
      echo good afternoon
    else
      echo good evening
    fi
}

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
printf "$(get_time_greeting) ${RED}$(whoami)${NC}, a new ${GREEN}adventure${NC} awaits\n"

if [ -f /usr/share/git/git-prompt.sh ]; then
    source /usr/share/git/git-prompt.sh
fi

setopt PROMPT_SUBST
PS1='%B%F{88}%n%F{white}@%F{94}$(hostname | cut -f1 -d".") %F{white}%1~ $(__git_ps1 "(%s) ")$ %b'

stty erase '^?'
bindkey -e

alias ls="ls -1 --color=auto"
alias l="ls -lah"
alias ll="ls -l"

function jp() {
    local directory=~/dev
    cd $(find $directory -maxdepth 2 -type d -print |
        grep -i $1 |
        head -n 1)
}

function fzfp() {
    local directory=~/dev
    cd $(find $directory -maxdepth 2 -type d -print |
        fzf --height 20 --border --header "Select a project")
}

function fzfc() {
    nvim $(find ~/.config -type f |
        fzf --height 20 --border --header "Select a config file")
}

alias zr="source ~/.zshrc"

export CLICOLOR=YES

autoload -U compinit; compinit
setopt MENU_COMPLETE
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete

export EDITOR=nvim
export MANPAGER=bat

if [[ -f /usr/share/nvm/init-nvm.sh ]] then
    source /usr/share/nvm/init-nvm.sh
fi

export PATH=~/.local/bin:$PATH
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
