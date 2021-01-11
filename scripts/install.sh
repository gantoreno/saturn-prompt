#!/bin/zsh

cd $ZSH/custom/themes

git clone $HOME/projects/saturn-prompt

ln -sf saturn-prompt/saturn.zsh saturn.zsh-theme

echo '🚀 Saturn is now installed, enjoy!'

source $HOME/.zshrc
