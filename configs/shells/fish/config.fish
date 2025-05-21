if status is-interactive
  # Commands to run in interactive sessions can go here
end

# Aliases
alias ls="exa -a --icons"
alias source_config="source ~/.config/fish/config.fish"
alias edit_config="nvim ~/.config/fish/"

# Initialize starship, zoxide and else for fish
starship init fish | source
zoxide init fish | source

# Themes
fish_config theme choose Dracula
