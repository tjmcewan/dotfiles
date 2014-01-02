alias g='git'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gs='git status -sb'
alias gpl='git fetch -p && git rebase'
alias gps='git push'
alias gpsu='git push -u'
alias ga='git add --all'
alias gm='git merge'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gf='git fetch -p'
alias gr='git reset'
alias gd='git diff'
alias gdw='git diff --word-diff'
alias gdc='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdm='git diff master'
alias gdn='git diff --name-only'
alias gdcn='git diff --cached  --name-only'
alias gdmn='git diff master --name-only'
alias gl='git log'
alias gcp='git cherry-pick'
alias gri='git rebase -i'
alias grim='git rebase -i master'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gsh='git show HEAD'
alias gshn='git show HEAD --name-only'
alias ge='git edit' # edit function in ~/.gitconfig
alias gcoh='git checkout HEAD --' # reverts changes for whatever file is passed
                                  # usage: $ gcoh lib/example.rb
alias gdmb='git diff $(git show-branch --merge-base)..HEAD'
alias gdmbn='git diff $(git show-branch --merge-base)..HEAD --name-only'
alias gap='git add -N . && git add -p'

alias gstl='git stash list'
alias gsts='git stash save -u'
gsta() { git stash apply stash@{"${1:-0}"} }
gstp() { git stash pop stash@{"${1:-0}"} }
gstsh() { git stash show stash@{"${1:-0}"} }
gstd() { git stash drop stash@{"${1:-0}"} }

gitme () {
  git init
  git commit -m 'blank slate' --allow-empty
  git add --all
  git commit -m 'pristine'
}

alias update_repos='for repo in **/.git; do cd $repo; git fetch; cd -; done'
alias update_remotes='for remote in $(git remote); do git fetch $remote ; done'

alias gx='gitx'