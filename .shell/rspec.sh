disable r # disable the zsh built-in so we can use `r`
r() { rspec "${@:-./spec}" }
