# global envs
# For Homebrew
set --global --export HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
set --global --export HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
set --global --export HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
fish_add_path --global --move --path "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin"

if test -n "$MANPATH[1]"
    set --global --export MANPATH '' $MANPATH
end

if not contains "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
    set --global --export INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH
end

# For fnm
set -gx PATH /run/user/1000/fnm_multishells/88443_1748022098570/bin $PATH
set -gx FNM_MULTISHELL_PATH /run/user/1000/fnm_multishells/88443_1748022098570
set -gx FNM_VERSION_FILE_STRATEGY local
set -gx FNM_DIR "/home/valen/.local/share/fnm"
set -gx FNM_LOGLEVEL info
set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist"
set -gx FNM_COREPACK_ENABLED false
set -gx FNM_RESOLVE_ENGINES true
set -gx FNM_ARCH x64

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
alias ls="exa -a --icons"
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
