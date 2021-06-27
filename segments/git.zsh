SATURN_GIT_COLOR="${SATURN_GIT_COLOR="magenta"}"
SATURN_GIT_SYMBOL_CLEAN="${SATURN_GIT_SYMBOL="$([[ ! -z $SATURN_EMOJIS_ENABLED ]] && echo "🌳" || echo "")"}"
SATURN_GIT_SYMBOL_DIRTY="${SATURN_GIT_SYMBOL_DIRTY="$([[ ! -z $SATURN_EMOJIS_ENABLED ]] && echo "❗️" || echo "[!?]")"}"

saturn_git() {
  local branch_icon=$SATURN_GIT_SYMBOL_CLEAN
  local branch_name=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

  [[ -z $branch_name ]] && exit

  local segment=" on %F{$SATURN_GIT_COLOR}%B$branch_name $branch_icon%b%f"
  local branch_status=$(git status --porcelain)

  [[ ! -z $branch_status ]] && segment+=" %F{red}%B$SATURN_GIT_SYMBOL_DIRTY%b%f"

  printf %s $segment
}
