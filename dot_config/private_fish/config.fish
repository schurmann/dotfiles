if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -xg SUDO_EDITOR nvim
set -xg VISUAL nvim

alias v=nvim
alias lz=lazygit
alias fd=fdfind
alias cat=batcat

fish_add_path ~/.bin

## Config fzf fish plugin https://github.com/PatrickF1/fzf.fish
# disable timestamp column in search history
set fzf_history_opts --with-nth=4..

# https://github.com/jdx/rtx
rtx activate fish | source
rtx completion fish | source
rtx hook-env | source # needed to update path to access rtx plugins in this script
# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source
# https://github.com/twpayne/chezmoi
chezmoi completion fish | source

