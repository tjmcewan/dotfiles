alias rddm='rake db:drop; rake db:create; rake db:migrate'
alias rdm='rake db:migrate'
alias rds='rake db:seed'
alias rdtp='rake db:test:prepare'

# Rails 2 and Rails 3 console
rc () {
  if [ -e "./script/console" ]; then
    ./script/console --debugger $@
  else
    rails console --debugger $@
  fi
}

# Rails 2 and Rails 3 server
rs () {
  if [ -e "./script/server" ]; then
    ./script/server --debugger --binding=127.0.0.1 $@
  else
    rails server --debugger --binding=127.0.0.1 $@
  fi
}

rails_versions() {
  filename=Gemfile.lock
  for gemfile in **/$filename; do
    app=$(echo $gemfile | sed "s/\/$filename//g")
    rails_version=$(cat $gemfile | grep ' rails (\d')
    printf "$fg[magenta] $app: $fg[green] $rails_version"
    echo "$reset_color"
  done
}
