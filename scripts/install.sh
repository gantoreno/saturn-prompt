#!/bin/zsh

if [[ -z "$ZSH" ]] then
  echo "❌ You must have oh-my-zsh installed in order to use Saturn"
  echo "🌎 Get it here: https://ohmyz.sh/"

  exit 1
fi

(
  cd $ZSH/custom/themes

  git clone $HOME/projects/saturn-prompt

  ln -sf saturn-prompt/saturn.zsh saturn.zsh-theme

  sed -i -- 's/^ZSH_THEME=.*$/ZSH_THEME="saturn"/g' $HOME/.zshrc

  echo '👽 Your $ZSH_THEME was automatically switched to "saturn"'
  echo '🚀 Saturn is now installed, enjoy!'
)

exec zsh
