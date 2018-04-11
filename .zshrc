export BINSTUBS_PATH="./bin:./.bundle/bin:./.bundle/binstubs"
export PATH="$BINSTUBS_PATH:$HOME/.cabal/bin:/usr/local/heroku/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="./node_modules/.bin:$PATH"
export PATH="/Users/tim/Applications/bin:$PATH"
export PATH="/Users/tim/.shell/scripts:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="$(pyenv root)/shims:$PATH"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"

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

export REPORTTIME=30
setopt RM_STAR_WAIT

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# source all of the .sh files in ~/.shell too
for file in ~/.shell/*.sh; do
  source $file
done
unset file

export NVM_AUTO_USE=true # auto switches node version when `cd`ing
# export NVM_LAZY_LOAD=true # faster startup time, but breaks NVM_AUTO_USE
export NVM_DIR="/Users/tim/.nvm"
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # trad. way to load nvm
export PATH="/usr/local/opt/openssl/bin:$PATH"
