# dotfiles

I use [chezmoi](https://www.chezmoi.io/) to manage dotfiles.

## setup
- install chezmoi
- install depedencies since they might be referenced in `config.fish`
- create a data file used for templating at ~/.config/chezmoi/chezmoi.toml
    ```toml
    [data]
        email = "<email>"
        batBinary = "batcat"
    ```
- `chezmoi init --apply https://github.com/schurmann/dotfiles.git`

## dependencies

### terminal
https://github.com/kovidgoyal/kitty

### shell
https://github.com/fish-shell/fish-shell
https://github.com/jorgebucaran/fisher
https://github.com/PatrickF1/fzf.fish
https://github.com/IlanCosman/tide

### cli
https://github.com/neovim/neovim  
https://github.com/jdx/mise  
https://github.com/BurntSushi/ripgrep  
https://github.com/junegunn/fzf  
https://github.com/sharkdp/fd  
https://github.com/jesseduffield/lazygit  
https://github.com/ajeetdsouza/zoxide  

### font
https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono

### tools
g++

