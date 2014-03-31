alias b='bundle'
alias bo='bundle open'
alias be='bundle exec'
alias berk='bundle exec rake'

ber() { bundle exec rspec "${@:-./spec}" }

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
