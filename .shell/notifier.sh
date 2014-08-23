# call `notify "download finished"` from other shell functions
notify() {
  osascript -e "display notification \"$1\" with title \"Shell Function\""
}
