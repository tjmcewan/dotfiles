PATH="$HOME/usr/local/bin:/usr/local/sbin:$PATH"
# PATH="$PATH:$HOME/.rvm/bin"
# PATH="$(pyenv root)/shims:$PATH"
# PATH="/.cabal/bin:$PATH"
PATH="/usr/local/heroku/bin:$PATH"
PATH="/usr/local/share/npm/bin:$PATH"

PATH="/Users/tim/Applications/bin:$PATH"
PATH="/Users/tim/.shell/scripts:$PATH"
PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# GNU utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

LOCAL_BINS="./bin:./.bundle/bin:./.bundle/binstubs:./node_modules/.bin"
export PATH="$LOCAL_BINS:$PATH"

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

eval "$(rbenv init -)"
export NVM_AUTO_USE=true  # auto switches node version when `cd`ing
export NVM_LAZY_LOAD=true # faster startup time, but breaks NVM_AUTO_USE
export NVM_DIR="/Users/tim/.nvm"
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # trad. way to load nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/tim/.nvm/versions/node/v10.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/tim/.nvm/versions/node/v10.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/tim/.nvm/versions/node/v10.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/tim/.nvm/versions/node/v10.11.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/tim/getup/dynosaur/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/tim/getup/dynosaur/node_modules/tabtab/.completions/slss.zsh