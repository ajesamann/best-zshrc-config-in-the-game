# Set up our prompt
autoload -Uz vcs_info
precmd() {
    vcs_info

    # to show only the current folder use %1d instead of %~
    if [[ -z ${vcs_info_msg_0_} ]]; then
        PROMPT='đ¤ %F{147}%n đ %F{85}%~ đ´ %F{200}empty %fâś '
    else
        PROMPT="đ¤ %F{147}%n đ %F{85}%~ đ´ %F{202}${vcs_info_msg_0_} %fâś "
    fi
}

zstyle ':vcs_info:git:*' formats '%b'

# Commands
alias zshrc="code ~/.zshrc"
alias reload='echo -e "\033[1m<-- TERMINAL RELOADED @ $(date +%d.%m.%y-%H:%M:%S) -->\033[0m"; exec zsh -l'
alias work="cd /; cd Users/<username>/Desktop/<code folder>; ls"
alias home="cd /; cd Users/<username>"
