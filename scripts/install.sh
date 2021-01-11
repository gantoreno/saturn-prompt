#!/bin/zsh

if [[ -z "$ZSH" ]] then
  echo "❌ You must have oh-my-zsh installed in order to use Saturn"
  echo "🌎 Get it here: https://ohmyz.sh/"

  exit 1
fi

cd $ZSH/custom/themes

git clone $HOME/projects/saturn-prompt

ln -sf saturn-prompt/saturn.zsh saturn.zsh-theme

echo '👽 Remember to set ZSH_THEME="saturn" in your .zshrc'
echo '🚀 Saturn is now installed, enjoy!'

source $HOME/.zshrc
