# Set up our prompt
autoload -Uz vcs_info
precmd() {
    vcs_info

    # to show only the current folder use %1d instead of %~
    if [[ -z ${vcs_info_msg_0_} ]]; then
        PROMPT='🤓 %F{147}%n 📁 %F{85}%~ 🌴 %F{200}empty %f▶ '
    else
        PROMPT="🤓 %F{147}%n 📁 %F{85}%~ 🌴 %F{202}${vcs_info_msg_0_} %f▶ "
    fi
}

zstyle ':vcs_info:git:*' formats '%b'

# Commands
alias zshrc="code ~/.zshrc"
alias reload='echo -e "\033[1m<-- TERMINAL RELOADED @ $(date +%d.%m.%y-%H:%M:%S) -->\033[0m"; exec zsh -l'
