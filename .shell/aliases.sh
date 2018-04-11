# Edit Shell Profile, Source Shell Profile
alias esp='$EDITOR ~/.shell ~/.ackrc ~/.aws ~/.gemrc ~/.gitconfig ~/.gitignore ~/.gitignore_global ~/.rspec ~/.rdebugrc  ~/.pgpass ~/.zshrc'
alias ssp='source ~/.zshrc'

alias ll='ls -Glah'
alias l='ls -Glah'

alias p='python'
alias v='vagrant'
alias a='ansible'
alias d='docker'
alias dc='docker-compose'

# alias server='python -m SimpleHTTPServer'
alias server='echo "http://localhost:3000/" && ruby -run -e httpd . -b127.0.0.1 -p3000'

# alias wimp="ifconfig | grep inet | grep -v inet6 | grep -v 127.0 | cut -d ' '' -f 2"
alias wimp="ipconfig getifaddr en0"

# google apps manager
alias gam="/Users/tim/bin/gam/gam"
