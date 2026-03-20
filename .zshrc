# Generic
reload() {
  echo -e "\n\033[1;36m✦✦✦ TERMINAL RELOADED ✦✦✦\033[0m"
  echo -e "\033[1;33m$(date "+%A, %b %d %Y %H:%M:%S")\033[0m\n"
  exec zsh -l
}

# SSH
alias ssh-start='eval "$(ssh-agent -s)"'
alias ssh-files='ls ~/.ssh'
alias ssh-clear='ssh-add -D'
alias ssh-active='ssh-add -l'

alias ssh-help='echo "
ssh-start       → Start the ssh-agent
ssh-files       → List files in ~/.ssh
ssh-clear       → Remove all keys from the ssh-agent
ssh-active      → Show currently loaded keys
ssh-add <key>   → Add key to the agent
ssh-help        → Show this help message
"'

# Projects
alias itapmenu='cd ~/desktop/code/itapmenu'
alias sellmore='cd ~/desktop/code/sellmore'
alias lizardbox='cd ~/desktop/code/lizardbox'

# Git
alias blank='git commit --allow-empty -m "trigger deploy" && git push'

# Salesforce CLI Shortcuts
alias sforgs='sf org list'

sfconnect() {
  sf org login web --instance-url "$1" --alias "$2"
}

sfpull() {
  sf project retrieve start --target-org "$1" --manifest manifest/package.xml
}

sfshow() {
  sfdx force:org:display --target-org "$1" --verbose
}

alias sfhelp='echo "
sforgs                   → List all authenticated orgs
sfconnect <url> <alias>  → Connect/login to an org (sandbox or production)
sfpull <org>             → Pull metadata from an org using manifest/package.xml
sfshow <org>             → Show sensitive org details
sfhelp                   → Show this help message
"'

# Profile Setup
gitwho() {
  local email="$1"
  local name="AJ Esamann"
  local key=""

  if [ -z "$email" ]; then
    echo "Usage: gitwho <email>"
    return 1
  fi

  case "$email" in
    "ajethedev@gmail.com")
      key="$HOME/.ssh/id_ed25519_personal_github"
      ;;
    "aesamann@itapmenu.com")
      key="$HOME/.ssh/id_ed25519_work_bitbucket"
      ;;
    *)
      echo "Unknown email: $email"
      echo "Supported emails:"
      echo "  ajethedev@gmail.com"
      echo "  aesamann@itapmenu.com"
      return 1
      ;;
  esac

  git config --global user.name "$name"
  git config --global user.email "$email"

  ssh-clear
  ssh-start
  ssh-add "$key"

  echo "Switched git profile"
  echo "Name:    $(git config --global user.name)"
  echo "Email:   $(git config --global user.email)"
  echo "SSH key: $key"
}
