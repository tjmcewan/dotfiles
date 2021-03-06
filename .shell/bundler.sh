alias b='bundle'
alias bo='bundle open'
alias be='bundle exec'
alias bu='bundle update'
alias berk='bundle exec rake'
alias ber='bundle exec rspec'

bundler_apps() {
  find . -name Gemfile -print | sed 's/Gemfile//'
}

bundle_with_binstubs() {
  bundle --binstubs=$BINSTUBS_PATH
}

bundle_all_with_binstubs() {
  for app in $(bundler_apps); do
    cd $app
    $(bundle_with_binstubs)
    cd -
  done
}
