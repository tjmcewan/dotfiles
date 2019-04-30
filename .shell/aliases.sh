# Edit Shell Profile, Source Shell Profile
alias esp='$EDITOR ~/.shell ~/.ackrc ~/.aws ~/.gemrc ~/.gitconfig ~/.gitignore ~/.gitignore_global ~/.rspec ~/.rdebugrc  ~/.pgpass ~/.zshrc'
alias ssp='source ~/.zshrc'

alias ll='ls -Glah --color'
alias l='ls -Glah --color'

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

alias yaml2json="python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'"

alias dnsflush="sudo killall -HUP mDNSResponder"
alias flushdns="dnsflush"
