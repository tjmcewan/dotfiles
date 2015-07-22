alias g='git'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gs='git status -sb'
alias gpl='git fetch -p && git rebase -p'
alias gps='[[ $(git config "branch.$(git rev-parse --abbrev-ref HEAD).merge") = "" ]] && git push -u || git push'
alias ga='git add --all'
alias gm='git merge'
alias gmom='git merge origin/master'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gf='git fetch --prune --tags'
alias gr='git reset'
alias grom='git reset origin/master'
alias gd='git diff'
alias gdw='git diff --word-diff'
alias gdc='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdm='git diff master'
alias gdom='git diff origin/master'
alias gdomn='git diff origin/master --name-only'
alias gdn='git diff --name-only'
alias gdcn='git diff --cached  --name-only'
alias gdmn='git diff master --name-only'
alias gl='git log'
alias gcp='git cherry-pick'
alias gri='git rebase -i'
alias grim='git rebase -i master'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
gsh() { git show ${1:-HEAD} }
gshn() { git show ${1:-HEAD} --name-only }
alias ge='git edit' # edit function in ~/.gitconfig
alias gx='gitx'
alias gcoh='git checkout HEAD --' # reverts changes for whatever file is passed
                                  # usage: $ gcoh lib/example.rb
alias gdmb='git diff $(git show-branch --merge-base)..HEAD'
alias gdmbn='git diff $(git show-branch --merge-base)..HEAD --name-only'
alias gap='git add -N . && git add -p'

alias glog='git log --branches --remotes --graph --oneline --decorate'

alias gstl='git stash list'
gsts() { git add --all; git stash save $1 } # --untracked on `save` works, but the untracked files don't `show`, so track them first
gsta() { git stash apply stash@{"${1:-0}"} }
gstp() { git stash pop stash@{"${1:-0}"} }
gstsh() { git stash show -p stash@{"${1:-0}"} }
gstd() { git stash drop stash@{"${1:-0}"} }

gitme() {
  git init
  git commit -m 'blank slate' --allow-empty
  git add --all
  git commit -m 'pristine'
}

alias gblame='git gui blame 2>/dev/null' # tried newer tcl-tk; no dice. /dev/null it is!
                                         # usage: $ gblame lib/example.rb

update_repos() {
  for repo in $(echo **/.git | sed "s/.git//g"); do
    cd $repo
    echo "$fg[green]# updating $fg[magenta]$repo $reset_color"
    git fetch -p
    git checkout master && git rebase
    git checkout -
    cd - 1>/dev/null
    echo ""
  done
}

update_remotes() {
  for remote in $(git remote); do
    git fetch $remote
  done
}

# need to "export" the function for bash so GNU 'parallel' can see it.
# http://stackoverflow.com/a/22738506/320438
export bash_update_repo='() {
  echo ""
  echo ""
  cd $1
  echo "# updating $1"
  git fetch -p
  git checkout master && git rebase
  git checkout -
}'

update_repos_parallel() {
  # brew install parallel
  SHELL=/bin/bash parallel bash_update_repo ::: $(echo **/.git | sed "s/.git//g")
}
