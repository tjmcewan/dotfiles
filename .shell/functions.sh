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

monthly_changelog() {
  for app in $(bundler_apps); do
    echo "$fg[green]# changes for $fg[magenta]$app: $reset_color"
    cd $app
    git log --oneline --since={$(first_of_last_month)} --no-merges
    cd - > /dev/null
    echo; echo
  done
}

## this was a one-off for heartbleed, but could be handy to keep around
# token_deploy() {
#   sed -E -e "s/secret_token\ =\ \'(.+)\'/secret_token\ =\ $(rake_secret)/" -i '' config/initializers/secret_token.rb
#   git add config/initializers/secret_token.rb
#   git commit -m "update secret token"
#   git push
#   $(bundle_with_binstubs)
#   cap staging deploy
# }

## this function exports other functions so they can be passed to another shell (bash, for instance)
# exportf(){
#     export $(echo $1)="`whence -f $1 | sed -e "s/$1 //" `"
# }

remove_spaces_in_filenames() {
  if [ -z $1 ]; then echo "provide target directory"; return 1; fi

  find "$1" -type f -name "* *" | while read -r FILE
  do
      mv -v "$FILE" `echo $FILE | tr ' ' '_' `
  done
}

