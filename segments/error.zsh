SATURN_ERROR_COLOR="${SATURN_ERROR_COLOR="red"}"
SATURN_ERROR_ICON="${SATURN_ERROR_ICON="❌"}"

saturn_error() {
  local segment="%(?.. exited %F{$SATURN_ERROR_COLOR}%B%?%b%f)"

  [[ ! -z $SATURN_EMOJIS_ENABLED ]] && segment+=" $SATURN_ERROR_ICON"

  printf %s $segment
}
