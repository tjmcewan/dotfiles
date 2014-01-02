# open the specified file in the default program, or
# fallback to opening the current directory in Finder
o() { open "${1:-.}" }

# pass specified files/folders to your editor, fallback to current directory
# usage:
# $ e ~/.zshrc .shell/
# $ e
e() { $EDITOR "${@:-.}" }

# kill cloud services that use your 3G data
cloud_off () {
  for process in Cloud Dropbox "Google Drive" Droplr Minbox
  do
    ps acx | grep "$process$" | awk '{ print $1 }' | xargs kill -15
  done
}

# this clears Finder's "Open With" menu (to get rid of duplicates)
openwithclear() {
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user
  killall Finder
}
