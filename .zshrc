# Set up our prompt
autoload -Uz vcs_info

precmd() {
    local EXIT="$?"
    vcs_info

    local STATUS_ICON=""
    if [[ $EXIT -eq 0 ]]; then
        STATUS_ICON="%F{green}✔%f"
    else
        STATUS_ICON="%F{red}✘%f"
    fi

    # Time
    local TIME="%F{244}%*%f"

    # Git branch/status
    local GIT=""
    if [[ -n ${vcs_info_msg_0_} ]]; then
        GIT=" 🌱 %F{39}${vcs_info_msg_0_}%f"
    fi

    # Prompt
    PROMPT="${STATUS_ICON} ${TIME} 🤓 %F{147}%n %F{244}at%f %F{85}%~%f${GIT} ▶ "
}

zstyle ':vcs_info:git:*' formats '%b'

# Commands
alias zshrc="code ~/.zshrc"
alias reload='echo -e "\033[1m<── TERMINAL RELOADED @ $(date +%d.%m.%y-%H:%M:%S) ──>\033[0m"; exec zsh -l'
alias work="cd /; cd Users/<username>/Desktop/<work folder>; ls"
alias home="cd /; cd Users/<username>"
