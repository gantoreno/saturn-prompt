#    ______      __         _      __   Gabriel Moreno
#   / ____/___ _/ /_  _____(_)__  / /   ==============
#  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
# / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
# \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
# 
# Saturn prompt 

# Saturn's current version
export SATURN_VERSION="0.2.0"

# Prompt icons
SATURN_MARK_COLOR="${SATURN_MARK_COLOR="%(?.green.red)"}"
SATURN_MARK_ICON_NORMAL="${SATURN_MARK_NORMAL_ICON="➜"}"
SATURN_MARK_ICON_ROOT="${SATURN_MARK_ROOT_ICON="❯"}"
SATURN_MARK_SEQUENCE="${SATURN_MARK_SEQUENCE="%(!.$SATURN_MARK_ICON_ROOT.$SATURN_MARK_ICON_NORMAL) "}"

saturn_mark() {
  printf %s "%F{$SATURN_MARK_COLOR}$SATURN_MARK_SEQUENCE%f"
}

# Newline
SATURN_NEWLINE="${SATURN_NEWLINE="$prompt_newline"}"

saturn_newline() {
  printf %s $SATURN_NEWLINE
}

# Path
SATURN_PATH_COLOR="${SATURN_PATH_COLOR="blue"}"
SATURN_PATH_SEQUENCE="${SATURN_PATH_SEQUENCE="%~"}"
SATURN_PATH_ICON="${SATURN_PATH_ICON="🪐"}"

saturn_path() {
  printf %s "%F{$SATURN_PATH_COLOR}%B$SATURN_PATH_SEQUENCE $SATURN_PATH_ICON%b%f"
}

# Time
SATURN_TIME_COLOR="${SATURN_TIME_COLOR="yellow"}"
SATURN_TIME_SEQUENCE="${SATURN_TIME_SEQUENCE="%D{%L:%M %p}"}"
SATURN_TIME_ICON="${SATURN_TIME_ICON="⏰"}"

saturn_time() {
  printf %s " at %F{$SATURN_TIME_COLOR}%B$SATURN_TIME_SEQUENCE $SATURN_TIME_ICON%b%f"
}

# Error/success status
SATURN_ERROR_COLOR="${SATURN_ERROR_COLOR="red"}"
SATURN_ERROR_ICON="${SATURN_ERROR_ICON="❌"}"

saturn_error() {
  printf %s "%(?.. exited %F{$SATURN_ERROR_COLOR}%B%? $SATURN_ERROR_ICON%b%f)"
}

# Git prompt
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

SATURN_SEGMENTS=(
  saturn_newline
  saturn_path
  saturn_git
  saturn_time
  saturn_error
  saturn_newline
  saturn_mark
)

saturn_prompt() {
  local prompt_string=""

  foreach prompt_segment in $SATURN_SEGMENTS
    prompt_string+=$($prompt_segment)
  end

  printf %s $prompt_string
}

PROMPT=$'$(saturn_prompt)'
