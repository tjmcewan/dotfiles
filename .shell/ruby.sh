alias rv='ruby -v'

# delete all gems; then install latest rake, bundler, etc.
gemclear () {
  for i in `gem list --no-versions`; do
    gem uninstall -aIx $i
  done
}

gem_refresh() {
  $(gemclear)
  gem install rake bundler rspec # fuubar rubygems-bundler zeus
  if [ -e "./Gemfile" ]; then
    bundle install
  fi
}

gemack () {
  if [ -e "./Gemfile" ]; then
    ack --type=ruby "$@" `bundle show --paths`
  else
    ack --type=ruby "$@" $GEM_HOME
  fi
}

ruby_versions() {
  filename=.ruby-version
  for version_file in **/$filename; do
    app=$(echo $version_file | sed "s/\/$filename//g")
    ruby_version=$(cat $version_file)
    printf "$fg[magenta] $app: $fg[green] $ruby_version"
    echo "$reset_color"
  done
}

rake_secret() {
  ruby -r securerandom -e "p SecureRandom.hex(128)"
}
