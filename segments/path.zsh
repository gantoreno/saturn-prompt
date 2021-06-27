SATURN_PATH_COLOR="${SATURN_PATH_COLOR="blue"}"
SATURN_PATH_SEQUENCE="${SATURN_PATH_SEQUENCE="%~"}"
SATURN_PATH_ICON="${SATURN_PATH_ICON="🪐"}"

saturn_path() {
  local segment="%F{$SATURN_PATH_COLOR}%B$SATURN_PATH_SEQUENCE%b%f"

  [[ ! -z $SATURN_EMOJIS_ENABLED ]] && segment+=" $SATURN_PATH_ICON"

  printf %s $segment
}
