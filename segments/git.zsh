SATURN_GIT_COLOR="${SATURN_GIT_COLOR="magenta"}"
SATURN_GIT_SYMBOL_CLEAN="${SATURN_GIT_SYMBOL="🌳"}"
SATURN_GIT_SYMBOL_DIRTY="${SATURN_GIT_SYMBOL_DIRTY="⁉️ "}"

saturn_git() {
  local branch_icon=$SATURN_GIT_SYMBOL_CLEAN
  local branch_name=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

  [[ -z $branch_name ]] && exit
  
  local branch_status=$(git status --porcelain)

  [[ ! -z $branch_status ]] && branch_icon=$SATURN_GIT_SYMBOL_DIRTY

  branch_name="%F{$SATURN_GIT_COLOR}%B$branch_name $branch_icon%b%f"
  branch_name=" on $branch_name"
  
  printf %s $branch_name
}
