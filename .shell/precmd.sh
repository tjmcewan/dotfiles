# pieced together from http://superuser.com/a/292660/98246 & https://gist.github.com/phette23/5270658

precmd() {
  # sets the terminal tab title to current dir (Terminal & iTerm)
  echo -ne "\e]1;${PWD##*/}\a"
}
