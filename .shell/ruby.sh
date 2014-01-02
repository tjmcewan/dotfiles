export RUBY_GC_MALLOC_LIMIT=90000000
export RUBY_FREE_MIN=200000

alias rv='ruby -v'

# delete all gems; then install latest rake, bundler, & zeus
gemclear () {
  for i in `gem list --no-versions`; do
    gem uninstall -aIx $i
  done
  gem install rake bundler zeus
  if [ -e "./Gemfile" ]; then
    bundle install
  fi
}

gemack () {
  ack --type=ruby "$@" $GEM_HOME
}
