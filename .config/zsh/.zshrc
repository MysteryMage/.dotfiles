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

if [ -f /usr/share/git/git-prompt.sh ]; then
    source /usr/share/git/git-prompt.sh
fi

setopt PROMPT_SUBST
# PS1='%B%F{88}%f%n%F{white}@%f%F{94}$(hostname | cut -f1 -d".")%f %F{white}%1~ $(__git_ps1 "(%s) ")$ %f'
# PS1='> %F{white}%1~ $(__git_ps1 "(%s) ")$ %f'
PS1='@%F{94}$(hostname | cut -f1 -d".")%f %F{white}%1~ $(__git_ps1 "(%s) ")$ %f'

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
export MANPAGER='nvim +Man!'

export PATH=~/.local/bin:$PATH
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NODE_REPL_HISTORY="$XDG_STATE_HOME"/node_repl_history
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export PYTHON_HISTORY=$XDG_DATA_HOME/python/history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export NVM_DIR="$XDG_DATA_HOME"/nvm

if [[ -f /usr/share/nvm/init-nvm.sh ]] then
    source /usr/share/nvm/init-nvm.sh
fi

