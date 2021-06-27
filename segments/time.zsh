SATURN_TIME_COLOR="${SATURN_TIME_COLOR="yellow"}"
SATURN_TIME_SEQUENCE="${SATURN_TIME_SEQUENCE="%D{%L:%M %p}"}"
SATURN_TIME_ICON="${SATURN_TIME_ICON="⏰"}"

saturn_time() {
  local segment=" at %F{$SATURN_TIME_COLOR}%B$SATURN_TIME_SEQUENCE%b%f"

  [[ ! -z $SATURN_EMOJIS_ENABLED ]] && segment+=" $SATURN_TIME_ICON"

  printf %s $segment
}
