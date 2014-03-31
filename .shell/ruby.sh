alias rv='ruby -v'

# delete all gems; then install latest rake, bundler, etc.
gemclear () {
  for i in `gem list --no-versions`; do
    gem uninstall -aIx $i
  done
  gem install rake bundler rspec # fuubar rubygems-bundler zeus
  if [ -e "./Gemfile" ]; then
    bundle install
  fi
}

gemack () {
  ack --type=ruby "$@" $GEM_HOME
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
