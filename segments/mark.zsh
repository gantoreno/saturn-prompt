SATURN_MARK_COLOR_SUCCESS="${SATURN_MARK_COLOR_SUCCESS="green"}"
SATURN_MARK_COLOR_ERROR="${SATURN_MARK_COLOR_ERROR="red"}"
SATURN_MARK_ICON_NORMAL="${SATURN_MARK_ICON_NORMAL="➜"}"
SATURN_MARK_ICON_ROOT="${SATURN_MARK_ICON_ROOT="❯"}"

saturn_mark() {
  printf %s "%(?.%F{$SATURN_MARK_COLOR_SUCCESS}.%F{$SATURN_MARK_COLOR_ERROR})%(!.$SATURN_MARK_ICON_ROOT.$SATURN_MARK_ICON_NORMAL)%f "
}
