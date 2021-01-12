# Saturn prompt
#
# Author: Gabriel Moreno, mail@gantoreno.com
# License: MIT
# https://github.com/hollandsgabe/saturn-prompt

# Saturn's current version
export SATURN_VERSION='0.1.1'

# Prompt variables
SATURN_PROMPT_ICON="${SATURN_PROMPT_ICON=🪐}"

SATURN_PATH_COLOR="${SATURN_PATH_COLOR=cyan}"

SATURN_RIGHT_PROMPT="${SATURN_RIGHT_PROMPT=true}"

SATURN_TIME_COLOR="${SATURN_TIME_COLOR=yellow}"
SATURN_TIME_FORMAT="${SATURN_TIME_FORMAT=%t}"

SATURN_SUCCESS_COLOR="${SATURN_SUCCESS_COLOR=green}"
SATURN_SUCCESS_ICON="${SATURN_SUCCESS_ICON=✔}"

SATURN_ERROR_COLOR="${SATURN_ERROR_COLOR=red}"
SATURN_ERROR_ICON="${SATURN_ERROR_ICON=✘}"

SATURN_GIT_PROMPT_SYMBOL="${SATURN_GIT_PROMPT_SYMBOL=שׂ}"

SATURN_GIT_PROMPT_COLOR="${SATURN_GIT_PROMPT_COLOR=magenta}"
SATURN_GIT_PROMPT_COLOR_DIRTY="${SATURN_GIT_PROMPT_COLOR_DIRTY=red}"

if [[ "$plugins" =~ "shrink-path" ]] then
  SATURN_PATH_FORMAT="${SATURN_PATH_FORMAT=$(shrink_path -f)}"
fi

# Prompt (left)
PROMPT=$''
PROMPT+=$'$SATURN_PROMPT_ICON '                             # Prompt icon

if [[ "$plugins" =~ "shrink-path" ]] then
  PROMPT+=$'%B%F{$SATURN_PATH_COLOR}$(shrink_path -f)%f%b ' # Use shrink_path if present
else
  PROMPT+=$'%B%F{$SATURN_PATH_COLOR}%~%f%b '                # Fallback to regular path
fi

PROMPT+=$'$(git_prompt_info)'                               # VCS

if [[ $TERM_PROGRAM == "vscode" ]] then
  PROMPT+=$' '                                              # Add extra space for VSCode
fi

# Prompt (right)
RPROMPT=$''

if [[ $SATURN_RIGHT_PROMPT == "true" ]] then
  RPROMPT+=$'%(?.%F{$SATURN_SUCCESS_COLOR}$SATURN_SUCCESS_ICON.%F{$SATURN_ERROR_COLOR}$SATURN_ERROR_ICON%f) ' # Status
  RPROMPT+=$'%B%F{$SATURN_TIME_COLOR}$SATURN_TIME_FORMAT%f%b'                                                 # Time
fi

# Git elements
ZSH_THEME_GIT_PROMPT_PREFIX="on %B%F{$SATURN_GIT_PROMPT_COLOR}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" %F{$SATURN_GIT_PROMPT_COLOR}$SATURN_GIT_PROMPT_SYMBOL%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY=" %B%F{$SATURN_GIT_PROMPT_COLOR_DIRTY}[!]%f%b"
ZSH_THEME_GIT_PROMPT_CLEAN=""
