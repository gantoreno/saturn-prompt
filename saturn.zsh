# Saturn prompt
#
# Author: Gabriel Moreno, gantoreno@gmail.com
# License: MIT
# https://github.com/hollandsgabe/saturn-prompt

# Saturn's current version
export SATURN_VERSION="0.1.2"

# +-----------------------------------------------------------+
# | PROMPT VARIABLES                                          |
# | Dynamic values that can be configured/overriden in .zshrc |
# +-----------------------------------------------------------+

# Prompt icon
SATURN_PROMPT_ICON="${SATURN_PROMPT_ICON="🪐"}"

# Path
SATURN_PATH_COLOR="${SATURN_PATH_COLOR="cyan"}"

# Time
SATURN_TIME_COLOR="${SATURN_TIME_COLOR=yellow}"
SATURN_TIME_FORMAT="${SATURN_TIME_FORMAT="%D{%L:%M %p}"}"

# Error/success status
SATURN_SUCCESS_COLOR="${SATURN_SUCCESS_COLOR="green"}"
SATURN_SUCCESS_ICON="${SATURN_SUCCESS_ICON="✔"}"
SATURN_ERROR_COLOR="${SATURN_ERROR_COLOR="red"}"
SATURN_ERROR_ICON="${SATURN_ERROR_ICON="✘"}"

# Git prompt
SATURN_GIT_PROMPT_SYMBOL="${SATURN_GIT_PROMPT_SYMBOL="שׂ"}"
SATURN_GIT_PROMPT_COLOR="${SATURN_GIT_PROMPT_COLOR="magenta"}"
SATURN_GIT_PROMPT_COLOR_DIRTY="${SATURN_GIT_PROMPT_COLOR_DIRTY="red"}"

# Right prompt
SATURN_RIGHT_PROMPT="${SATURN_RIGHT_PROMPT="true"}"

# Git elements
ZSH_THEME_GIT_PROMPT_PREFIX="on %B%F{$SATURN_GIT_PROMPT_COLOR}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %F{$SATURN_GIT_PROMPT_COLOR}$SATURN_GIT_PROMPT_SYMBOL%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{$SATURN_GIT_PROMPT_COLOR_DIRTY}[!]%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [[ "$plugins" =~ "shrink-path" ]] then
  SATURN_PATH_FORMAT="${SATURN_PATH_FORMAT=$(shrink_path -f)}"
fi

# +------------------------------------------------+
# | PROMPT                                         |
# | Build the prompt based on the config variables |
# +------------------------------------------------+

# Prompt
PROMPT=$''

# Prompt icon
PROMPT+=$'$SATURN_PROMPT_ICON '

# Use shrink_path if present
# Otherwise, fallback to regular path
if [[ "$plugins" =~ "shrink-path" ]] then
  PROMPT+=$'%B%F{$SATURN_PATH_COLOR}$(shrink_path -f)%f%b '
else
  PROMPT+=$'%B%F{$SATURN_PATH_COLOR}%~%f%b '
fi

# VCS
PROMPT+=$'$(git_prompt_info)'

# Extra space on VSCode
if [[ "$TERM_PROGRAM" == "vscode" ]] then
  PROMPT+=$' '
fi

# Check if RPROMPT is present
if [[ $SATURN_RIGHT_PROMPT == "true" ]] then
  # RPROMPT
  RPROMPT=$''

  # Error/success status
  RPROMPT+=$'%(?.%F{$SATURN_SUCCESS_COLOR}$SATURN_SUCCESS_ICON.%F{$SATURN_ERROR_COLOR}$SATURN_ERROR_ICON%f) '

  # Time
  RPROMPT+=$'%B%F{$SATURN_TIME_COLOR}$SATURN_TIME_FORMAT%f%b'
fi
