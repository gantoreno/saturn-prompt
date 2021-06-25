SATURN_ERROR_COLOR="${SATURN_ERROR_COLOR="red"}"
SATURN_ERROR_ICON="${SATURN_ERROR_ICON="❌"}"

saturn_error() {
  printf %s "%(?.. exited %F{$SATURN_ERROR_COLOR}%B%? $SATURN_ERROR_ICON%b%f)"
}
