#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
WHITE="\033[37m"
NORMAL="\033[0;39m"

sudo -v

printf "\n${WHITE}==============================================================================

SETTING UP YOUR COMPUTER!

==============================================================================${NORMAL}\n"

# Install Oh My Fish
printf "\n${BLUE}Installing Oh My Fish...${NORMAL}\n"
curl -L https://get.oh-my.fish | fish
omf install simple-ass-prompt

# Copy Fish config
printf "${YELLOW}Copying Fish config${NORMAL}\n"
cp -r fish ~/.config/

# set fish to default
echo (which fish) >> /etc/shells
chsh -s (which fish)

# install rust
printf "${YELLOW}Installing rust${NORMAL}\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

printf "${YELLOW}Installing cargo tools${NORMAL}\n"
source $HOME/.cargo/env
cargo install bat
cargo install bindgen
cargo install btm
cargo install broot
cargo install cargo-expand
cargo install cargo-license
cargo install cargo-update
cargo install cbindgen
cargo install fd-find
cargo install flamegraph
cargo install git-journal
cargo install grex
cargo install hyperfine
cargo install sccache
cargo install tokei
cargo install xsv
cargo install zoxide
# TODO: cargo install glow

# copy vim config
printf "${YELLOW}Copying vim config${NORMAL}\n"
cp -r .vim ~/


# copy git files
printf "${YELLOW}Copying git confg${NORMAL}\n"
cp .gitignore ~/
git config --global core.editor 'nvim'
git config --global core.excludesfile ~/.gitignore

# Set up VS Code Settings and Extensions
sh scripts/vscode.sh

# TODO: copy linting files

# TODO: set up intellij settings

# TODO: install tmux config
#ln -s -f .tmux/.tmux.conf
#cp .tmux/.tmux.conf.local 

# TODO: auto install nerd fonts https://github.com/ryanoasis/nerd-fonts

# Add global NPM packages
printf "\n${GREEN}Installing global npm packages for ${NORMAL}\n"
npm install -g gatsby-cli prettier eslint


# Follow the instructions on GitHub to generate a new SSH key and add it to your Github account.
printf "\n${WHITE}==============================================================================

${GREEN}All set!

${WHITE}Make sure to follow the instructions on GitHub to generate a new SSH key and then add the key to your GitHub account.

==============================================================================${NORMAL}\n"

open
https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key
open https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account
