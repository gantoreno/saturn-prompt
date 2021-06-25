#    ______      __         _      __   Gabriel Moreno
#   / ____/___ _/ /_  _____(_)__  / /   ==============
#  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
# / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
# \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
# 
# Saturn prompt 

export SATURN_VERSION="0.2.0"

[[ -z "$SATURN_ROOT" ]] && export SATURN_ROOT=${${(%):-%x}:A:h}

source $SATURN_ROOT/segments/mark.zsh
source $SATURN_ROOT/segments/error.zsh
source $SATURN_ROOT/segments/path.zsh
source $SATURN_ROOT/segments/newline.zsh
source $SATURN_ROOT/segments/git.zsh
source $SATURN_ROOT/segments/time.zsh

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
