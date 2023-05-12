autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{5}(%b%u)%f '
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' enable git

setopt PROMPT_SUBST
PS1='%B%F{88}%n%F{white}@%F{94}$(hostname | cut -f1 -d".") %F{white}%1~ ${vcs_info_msg_0_}$ %b'

stty erase '^?'
bindkey -e

alias l="ls -lah"
alias ll="ls -l"

jp() {
    local directory=~/dev
    cd $(find $directory -maxdepth 2 -type d -print |
        grep -i $1 |
        head -n 1)
}

fzfp() {
    local directory=~/dev
    cd $(find $directory -maxdepth 2 -type d -print |
        fzf --height 20 --border --header "Select a project")
}

fzfc() {
    nvim $(find ~/.config -type f |
        fzf --height 20 --border --header "Select a config file")
}

alias zr="source ~/.zshrc"

export CLICOLOR=YES

autoload -U compinit; compinit
setopt MENU_COMPLETE
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

export EDITOR=nvim
export MANPAGER=bat
