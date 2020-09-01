### how to setup a new environment:

1. install the command line tools `xcode-select --install`
- `git clone git@github.com:tjmcewan/dotfiles.git ~/dotfiles`
- `cd ~/dotfiles`
- `for file in $(ls -A); do mv $file ../. ; done`
- `cd .. && rm -r ./dotfiles`
- open a new shell; you should see a coloured prompt & a git branch indicator on the right
- change the git name/email: `e .gitconfig`
