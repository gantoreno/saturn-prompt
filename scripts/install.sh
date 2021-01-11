#!/bin/zsh

cd $ZSH/custom/themes

git clone $HOME/projects/saturn-prompt

ln -sf saturn-prompt/saturn.zsh saturn.zsh-theme

echo '👽 Remember to set ZSH_THEME="saturn" in your .zshrc'
echo '🚀 Saturn is now installed, enjoy!'

source $HOME/.zshrc
