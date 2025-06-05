if status is-interactive
  # Commands to run in interactive sessions can go here
end

# Aliases
alias ls="exa -s type -al --icons"
alias source_config="source ~/.config/fish/config.fish"
alias edit_config="nvim ~/.config/fish/"
alias escuela="cd ~/Escritorio/Escuela-2025/"

# Git aliases
alias gs="git status -s"
alias gaa="git add ."
alias gp="git push -u origin main"
alias gpp="git pull"
alias gcls="git config --global --list"
alias glo="git log --oneline"

# Initialize starship, zoxide and else for fish
starship init fish | source
zoxide init fish | source

# Themes
fish_config theme choose Dracula

# pnpm
set -gx PNPM_HOME "/home/valen/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
