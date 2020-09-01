PATH="$HOME/.local/bin:$HOME/usr/local/bin:/usr/local/sbin:$PATH"
# PATH="$PATH:$HOME/.rvm/bin"
# PATH="$(pyenv root)/shims:$PATH"
# PATH="/.cabal/bin:$PATH"
PATH="/usr/local/heroku/bin:$PATH"
PATH="/usr/local/share/npm/bin:$PATH"

PATH="$HOME/Applications/bin:$PATH"
PATH="$HOME/.shell/scripts:$PATH"
PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# data science
# PATH="/usr/local/anaconda3/bin:$PATH"

# GNU utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

LOCAL_BINS="./bin:./.bundle/bin:./.bundle/binstubs:./node_modules/.bin"
GLOBAL_ELM="/usr/local/bin/elm"
export PATH="$LOCAL_BINS:$GLOBAL_ELM:$PATH"

export EDITOR='code'

# homebrew autocompletion
if type brew &>/dev/null; then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

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

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init -)"
export NVM_AUTO_USE=true # auto switches node version when `cd`ing
# export NVM_LAZY_LOAD=true # faster startup time, but breaks NVM_AUTO_USE
export NVM_DIR="$HOME/.nvm"
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # trad. way to load nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

gam() { "$HOME/bin/gam/gam" "$@"; }
