export BINSTUBS_PATH="./.bundle/bin"
export PATH="/usr/local/heroku/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"

export EDITOR='subl'

# needed to compile some older software (ruby 1.8 ?)
# do this first: `brew tap homebrew/versions && brew install apple-gcc42`
# export CC=/usr/local/bin/gcc-4.2

# fast file move/rename; run `mmv` for usage
autoload -U zmv
alias mmv='noglob zmv -W'

# press ctrl-u to kill everything left of cursor
bindkey \^U backward-kill-line

bindkey \^\[\^\[\[D emacs-backward-word
bindkey \^\[\^\[\[C emacs-forward-word
bindkey -e

setopt HIST_IGNORE_DUPS
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000000
setopt appendhistory autocd

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# source all of the .sh files in ~/.shell too
for file in ~/.shell/*.sh; do
  source $file
done
