### how to setup a new environment:

1. install the command line tools `xcode-select --install`
- install [brew](brew.sh) (`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`)
- `brew install zsh`
- `echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells`
- `chsh -s /usr/local/bin/zsh`
- `git clone git@github.com:jobfutures/dotfiles.git ~/dotfiles`
- `cd ~/dotfiles`
- `for file in $(ls -A); do mv $file ../. ; done`
- `rm ~/dotfiles`
- open a new shell; you should see a coloured prompt & a git branch indicator on the right
- check everything is ok with brew: `brew doctor`
- [download and install sublime text](http://www.sublimetext.com/3)
- `ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl`
- change the git name/email: `e .gitconfig`
